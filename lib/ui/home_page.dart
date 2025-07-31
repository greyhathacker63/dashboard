import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/info_bloc.dart';
import '../bloc/config_bloc.dart';
import '../models/info_model.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<InfoBloc>().add(LoadInfo());
  }

  @override
  Widget build(BuildContext context) {
    // Access the current config state
    final ConfigState config = context.watch<ConfigBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard", style: GoogleFonts.inter()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      drawer: _buildAppDrawer(context),
      body: BlocBuilder<InfoBloc, InfoState>(
        builder: (context, state) {
          if (state is InfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is InfoLoaded) {
            return _buildInfoGrid(
              context,
              state.infoItems,
              state.expandedStates,
            );
          } else if (state is InfoError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(config.gridMainAxisSpacing),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: config.errorIconColor,
                      size: config.errorIconSize,
                    ),
                    SizedBox(height: config.errorIconTextSpacing),
                    Text(
                      'Failed to load information: ${state.message}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: config.errorTextColor,
                        fontSize: config.errorTextFontSize,
                      ),
                    ),
                    SizedBox(height: config.errorButtonSpacing),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<InfoBloc>().add(LoadInfo());
                      },
                      icon: const Icon(Icons.replay),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }

  // Helper method to build the App Drawer
  Widget _buildAppDrawer(BuildContext context) {
    final ConfigState config = context
        .watch<ConfigBloc>()
        .state; // Access config here too

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: config.drawerAvatarRadius,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.info_outline,
                    size: config.drawerAvatarIconSize,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: config.drawerHeaderSpacing),
                Text(
                  'AI Info Categories',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: config.drawerHeaderTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('App Settings'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          const Divider(),
          // Other category list tiles can remain or be removed based on preference
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Basics'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.science),
            title: const Text('Machine Learning'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.network_check),
            title: const Text('Deep Learning'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('NLP'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('Computer Vision'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text('Ethics'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build the Grid Layout of information cards
  Widget _buildInfoGrid(
    BuildContext context,
    List<InfoItem> infoItems,
    Map<String, bool> expandedStates,
  ) {
    final ConfigState config = context
        .watch<ConfigBloc>()
        .state; // Access config

    return Padding(
      padding: EdgeInsets.all(config.gridMainAxisSpacing),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
          childAspectRatio: config.cardAspectRatio,
          crossAxisSpacing: config.gridCrossAxisSpacing,
          mainAxisSpacing: config.gridMainAxisSpacing,
        ),
        itemCount: infoItems.length,
        itemBuilder: (context, index) {
          final item = infoItems[index];
          final isExpanded = expandedStates[item.id] ?? false;
          return _buildInfoCard(context, item, isExpanded);
        },
      ),
    );
  }

  // Helper method to build an individual information card
  Widget _buildInfoCard(BuildContext context, InfoItem item, bool isExpanded) {
    final ConfigState config = context
        .watch<ConfigBloc>()
        .state; // Access config

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(config.cardBorderRadius),
        onTap: () {
          context.read<InfoBloc>().add(ToggleExpand(item.id));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(config.cardBorderRadius),
              ),
              child: Image.network(
                item.imageUrl,
                height: config.cardImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: config.cardImageHeight,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey[600],
                        size: config.errorIconSize * 0.7,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: config.cardImageTextSpacing),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: config.expansionTilePaddingHorizontal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: config.cardTextColor,
                      fontSize: config.cardTitleFontSize,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: config.cardTitleCategorySpacing),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(
                        config.buttonBorderRadius,
                      ),
                    ),
                    child: Text(
                      item.category,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: config.cardCategoryFontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: config.cardBeforeExpandableSpacing),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ExpansionTile(
                  key: ValueKey(item.id),
                  initiallyExpanded: isExpanded,
                  onExpansionChanged: (bool expanding) {
                    context.read<InfoBloc>().add(ToggleExpand(item.id));
                  },
                  title: Text(
                    item.shortDescription,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: config.expansionCollapsedTextColor,
                      fontSize: config.cardShortDescriptionFontSize,
                    ),
                    maxLines: isExpanded ? null : 2,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        config.expansionChildrenPaddingHorizontal,
                        0,
                        config.expansionChildrenPaddingHorizontal,
                        config.expansionChildrenPaddingVertical,
                      ),
                      child: Text(
                        item.longDescription,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: config.expansionTextColor,
                          fontSize: config.cardLongDescriptionFontSize,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: config.expansionChildrenPaddingVertical,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Learn more about ${item.title}!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text('Read More'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
