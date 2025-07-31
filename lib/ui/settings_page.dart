import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/config_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings', style: GoogleFonts.inter()),
        centerTitle: true,
      ),
      body: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, configState) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSectionTitle(context, 'Color Settings'),
              _buildColorPicker(
                context,
                'Primary Color',
                configState.primaryColor,
                (color) => context.read<ConfigBloc>().add(
                  UpdateColorEvent(propertyName: 'primaryColor', color: color),
                ),
              ),
              _buildColorPicker(
                context,
                'Accent Color',
                configState.accentColor,
                (color) => context.read<ConfigBloc>().add(
                  UpdateColorEvent(propertyName: 'accentColor', color: color),
                ),
              ),
              _buildColorPicker(
                context,
                'App Bar Background',
                configState.appBarBackgroundColor,
                (color) => context.read<ConfigBloc>().add(
                  UpdateColorEvent(
                    propertyName: 'appBarBackgroundColor',
                    color: color,
                  ),
                ),
              ),
              _buildColorPicker(
                context,
                'Card Text Color',
                configState.cardTextColor,
                (color) => context.read<ConfigBloc>().add(
                  UpdateColorEvent(propertyName: 'cardTextColor', color: color),
                ),
              ),
              _buildColorPicker(
                context,
                'Button Background',
                configState.buttonBackgroundColor,
                (color) => context.read<ConfigBloc>().add(
                  UpdateColorEvent(
                    propertyName: 'buttonBackgroundColor',
                    color: color,
                  ),
                ),
              ),
              _buildColorPicker(
                context,
                'Button Pressed Color',
                configState.buttonPressedColor,
                (color) => context.read<ConfigBloc>().add(
                  UpdateColorEvent(
                    propertyName: 'buttonPressedColor',
                    color: color,
                  ),
                ),
              ),
              const Divider(height: 30),

              _buildSectionTitle(context, 'Spacing Settings'),
              _buildSlider(
                context,
                'Card Margin',
                configState.cardMargin,
                0.0,
                30.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(propertyName: 'cardMargin', value: value),
                ),
              ),
              _buildSlider(
                context,
                'Grid Spacing',
                configState.gridMainAxisSpacing,
                0.0,
                40.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'gridMainAxisSpacing',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Image-Text Spacing',
                configState.cardImageTextSpacing,
                0.0,
                30.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'cardImageTextSpacing',
                    value: value,
                  ),
                ),
              ),
              const Divider(height: 30),

              _buildSectionTitle(context, 'Size Settings'),
              _buildSlider(
                context,
                'Card Image Height',
                configState.cardImageHeight,
                80.0,
                250.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'cardImageHeight',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Card Title Font Size',
                configState.cardTitleFontSize,
                14.0,
                30.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'cardTitleFontSize',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Card Elevation',
                configState.cardElevation,
                0.0,
                20.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'cardElevation',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Card Border Radius',
                configState.cardBorderRadius,
                0.0,
                50.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'cardBorderRadius',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Button Border Radius',
                configState.buttonBorderRadius,
                0.0,
                30.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'buttonBorderRadius',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Button Elevation (Default)',
                configState.buttonElevationDefault,
                0.0,
                15.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'buttonElevationDefault',
                    value: value,
                  ),
                ),
              ),
              _buildSlider(
                context,
                'Button Elevation (Pressed)',
                configState.buttonElevationPressed,
                0.0,
                20.0,
                (value) => context.read<ConfigBloc>().add(
                  UpdateDoubleEvent(
                    propertyName: 'buttonElevationPressed',
                    value: value,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<ConfigBloc>().add(ResetConfig());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Settings reset to default!')),
                  );
                },
                icon: const Icon(Icons.restore),
                label: const Text('Reset to Default'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }

  Widget _buildSlider(
    BuildContext context,
    String label,
    double currentValue,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ${currentValue.toStringAsFixed(1)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Slider(
            value: currentValue,
            min: min,
            max: max,
            divisions: ((max - min) / 1).round(),
            label: currentValue.toStringAsFixed(1),
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.secondary,
            inactiveColor: Theme.of(
              context,
            ).colorScheme.secondary.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker(
    BuildContext context,
    String label,
    Color currentColor,
    ValueChanged<Color> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          GestureDetector(
            onTap: () async {
              Color? newColor = await showDialog<Color>(
                context: context,
                builder: (BuildContext dialogContext) {
                  Color tempColor = currentColor;
                  return AlertDialog(
                    title: Text('Select $label Color'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: tempColor,
                        onColorChanged: (color) {
                          tempColor = color;
                        },
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('SELECT'),
                        onPressed: () {
                          Navigator.of(dialogContext).pop(tempColor);
                        },
                      ),
                    ],
                  );
                },
              );
              if (newColor != null) {
                onChanged(newColor);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[400]!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlockPicker extends StatefulWidget {
  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  const BlockPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
  });

  @override
  State<BlockPicker> createState() => _BlockPickerState();
}

class _BlockPickerState extends State<BlockPicker> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.pickerColor;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.black,
      Colors.white,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentColor = color;
            });
            widget.onColorChanged(color);
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: _currentColor == color
                    ? Colors.blueAccent
                    : Colors.transparent,
                width: _currentColor == color ? 3.0 : 0.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
