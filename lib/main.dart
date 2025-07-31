// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/info_bloc.dart';
import 'bloc/config_bloc.dart';
import 'data/info_repository.dart';
import 'ui/home_page.dart';
import 'utils/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().loadConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InfoBloc(infoRepository: InfoRepository())..add(LoadInfo()),
        ),
        BlocProvider(
          create: (context) => ConfigBloc(), // Initialize ConfigBloc
        ),
      ],
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, configState) {
          return SafeArea(
            top: false,
            bottom: true,
            left: false,
            right: false,
            child: MaterialApp(
              title: configState.appTitle,
              theme: ThemeData(
                primarySwatch: configState.primarySwatch,
                primaryColor: configState.primaryColor,
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: configState.primarySwatch,
                  accentColor: configState.accentColor,
                  brightness: Brightness.light,
                ),
                scaffoldBackgroundColor: configState.scaffoldBackgroundColor,
                appBarTheme: AppBarTheme(
                  backgroundColor: configState.appBarBackgroundColor,
                  foregroundColor: configState.appBarForegroundColor,
                  titleTextStyle: GoogleFonts.inter(
                    fontSize: configState.appBarTitleFontSize,
                    fontWeight: FontWeight.bold,
                    color: configState.appBarForegroundColor,
                  ),
                ),
                cardTheme: CardThemeData(
                  elevation: configState.cardElevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      configState.cardBorderRadius,
                    ),
                  ),
                  margin: EdgeInsets.all(configState.cardMargin),
                ),
                textTheme:
                    GoogleFonts.interTextTheme(
                      Theme.of(context).textTheme,
                    ).apply(
                      bodyColor: configState.cardTextColor,
                      displayColor: configState.cardTextColor,
                    ),
                buttonTheme: ButtonThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      configState.buttonBorderRadius,
                    ),
                  ),
                  buttonColor: configState.buttonBackgroundColor,
                  textTheme: ButtonTextTheme.primary,
                ),
                expansionTileTheme: ExpansionTileThemeData(
                  iconColor: configState.expansionIconColor,
                  textColor: configState.expansionTextColor,
                  collapsedIconColor: configState.expansionCollapsedIconColor,
                  collapsedTextColor: configState.expansionCollapsedTextColor,
                  tilePadding: EdgeInsets.symmetric(
                    horizontal: configState.expansionTilePaddingHorizontal,
                    vertical: configState.expansionTilePaddingVertical,
                  ),
                  childrenPadding: EdgeInsets.symmetric(
                    horizontal: configState.expansionChildrenPaddingHorizontal,
                    vertical: configState.expansionChildrenPaddingVertical,
                  ),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return configState.buttonPressedColor;
                      } else if (states.contains(WidgetState.hovered)) {
                        return configState.buttonHoveredColor;
                      }
                      return configState.buttonBackgroundColor;
                    }),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      configState.buttonForegroundColor,
                    ),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                        horizontal: configState.buttonPaddingHorizontal,
                        vertical: configState.buttonPaddingVertical,
                      ),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          configState.buttonBorderRadius,
                        ),
                      ),
                    ),
                    elevation: WidgetStateProperty.resolveWith<double?>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return configState.buttonElevationPressed;
                      }
                      return configState.buttonElevationDefault;
                    }),
                  ),
                ),
              ),
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
