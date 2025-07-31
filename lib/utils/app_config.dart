import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../bloc/config_bloc.dart'; 

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  Map<String, dynamic> _config = {};

  Future<void> loadConfig() async {
    final String response = await rootBundle.loadString('assets/config.json');
    _config = json.decode(response);
  }

  String get appTitle => _config['appTitle'] ?? 'Default App Title';

  Color _hexToColor(String? hexString, {Color? defaultColor}) {
    if (hexString == null) return defaultColor ?? Colors.black;
    try {
      final hex = hexString.replaceAll('#', '');
      if (hex.length == 6) {
        return Color(int.parse('FF$hex', radix: 16));
      } else if (hex.length == 8) {
        return Color(int.parse(hex, radix: 16));
      }
      return defaultColor ?? Colors.black; // Fallback
    } catch (e) {
      return defaultColor ?? Colors.black; // Fallback
    }
  }

  MaterialColor get primarySwatch {
    String colorName = _config['colors']['primarySwatch'] ?? 'blueGrey';
    switch (colorName) {
      case 'red':
        return Colors.red;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'deepPurple':
        return Colors.deepPurple;
      case 'indigo':
        return Colors.indigo;
      case 'blue':
        return Colors.blue;
      case 'lightBlue':
        return Colors.lightBlue;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;
      case 'green':
        return Colors.green;
      case 'lightGreen':
        return Colors.lightGreen;
      case 'lime':
        return Colors.lime;
      case 'yellow':
        return Colors.yellow;
      case 'amber':
        return Colors.amber;
      case 'orange':
        return Colors.orange;
      case 'deepOrange':
        return Colors.deepOrange;
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'blueGrey':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }

  Color get primaryColor => _hexToColor(
    _config['colors']['primaryColorHex'],
    defaultColor: Colors.blueGrey[800],
  );
  Color get accentColor => _hexToColor(
    _config['colors']['accentColorHex'],
    defaultColor: Colors.tealAccent[400],
  );
  Color get scaffoldBackgroundColor => _hexToColor(
    _config['colors']['scaffoldBackgroundColorHex'],
    defaultColor: Colors.blueGrey[50],
  );
  Color get appBarBackgroundColor => _hexToColor(
    _config['colors']['appBarBackgroundColorHex'],
    defaultColor: Colors.blueGrey[900],
  );
  Color get appBarForegroundColor => _hexToColor(
    _config['colors']['appBarForegroundColorHex'],
    defaultColor: Colors.white,
  );
  Color get cardTextColor => _hexToColor(
    _config['colors']['cardTextColorHex'],
    defaultColor: Colors.blueGrey[900],
  );
  Color get expansionIconColor => _hexToColor(
    _config['colors']['expansionIconColorHex'],
    defaultColor: Colors.blueGrey[700],
  );
  Color get expansionTextColor => _hexToColor(
    _config['colors']['expansionTextColorHex'],
    defaultColor: Colors.blueGrey[900],
  );
  Color get expansionCollapsedIconColor => _hexToColor(
    _config['colors']['expansionCollapsedIconColorHex'],
    defaultColor: Colors.blueGrey[400],
  );
  Color get expansionCollapsedTextColor => _hexToColor(
    _config['colors']['expansionCollapsedTextColorHex'],
    defaultColor: Colors.blueGrey[700],
  );
  Color get buttonBackgroundColor => _hexToColor(
    _config['colors']['buttonBackgroundColorHex'],
    defaultColor: Colors.tealAccent[400],
  );
  Color get buttonPressedColor => _hexToColor(
    _config['colors']['buttonPressedColorHex'],
    defaultColor: Colors.tealAccent[700],
  );
  Color get buttonHoveredColor => _hexToColor(
    _config['colors']['buttonHoveredColorHex'],
    defaultColor: Colors.tealAccent[200],
  );
  Color get buttonForegroundColor => _hexToColor(
    _config['colors']['buttonForegroundColorHex'],
    defaultColor: Colors.white,
  );
  Color get errorIconColor => _hexToColor(
    _config['colors']['errorIconColorHex'],
    defaultColor: Colors.red[400],
  );
  Color get errorTextColor => _hexToColor(
    _config['colors']['errorTextColorHex'],
    defaultColor: Colors.red[700],
  );

  double get appBarTitleFontSize =>
      (_config['fontSizes']['appBarTitle'] as num?)?.toDouble() ?? 22.0;
  double get cardTitleFontSize =>
      (_config['fontSizes']['cardTitle'] as num?)?.toDouble() ?? 20.0;
  double get cardCategoryFontSize =>
      (_config['fontSizes']['cardCategory'] as num?)?.toDouble() ?? 12.0;
  double get cardShortDescriptionFontSize =>
      (_config['fontSizes']['cardShortDescription'] as num?)?.toDouble() ??
      16.0;
  double get cardLongDescriptionFontSize =>
      (_config['fontSizes']['cardLongDescription'] as num?)?.toDouble() ?? 15.0;
  double get errorTextFontSize =>
      (_config['fontSizes']['errorText'] as num?)?.toDouble() ?? 20.0;
  double get drawerHeaderTitleSize =>
      (_config['sizes']['drawerHeaderTitleSize'] as num?)?.toDouble() ?? 18.0;

  double get cardMargin =>
      (_config['spacing']['cardMargin'] as num?)?.toDouble() ?? 8.0;
  double get gridCrossAxisSpacing =>
      (_config['spacing']['gridCrossAxisSpacing'] as num?)?.toDouble() ?? 16.0;
  double get gridMainAxisSpacing =>
      (_config['spacing']['gridMainAxisSpacing'] as num?)?.toDouble() ?? 16.0;
  double get cardImageTextSpacing =>
      (_config['spacing']['cardImageTextSpacing'] as num?)?.toDouble() ?? 12.0;
  double get cardTitleCategorySpacing =>
      (_config['spacing']['cardTitleCategorySpacing'] as num?)?.toDouble() ??
      4.0;
  double get cardBeforeExpandableSpacing =>
      (_config['spacing']['cardBeforeExpandableSpacing'] as num?)?.toDouble() ??
      8.0;
  double get expansionTilePaddingHorizontal =>
      (_config['spacing']['expansionTilePaddingHorizontal'] as num?)
          ?.toDouble() ??
      16.0;
  double get expansionTilePaddingVertical =>
      (_config['spacing']['expansionTilePaddingVertical'] as num?)
          ?.toDouble() ??
      8.0;
  double get expansionChildrenPaddingHorizontal =>
      (_config['spacing']['expansionChildrenPaddingHorizontal'] as num?)
          ?.toDouble() ??
      16.0;
  double get expansionChildrenPaddingVertical =>
      (_config['spacing']['expansionChildrenPaddingVertical'] as num?)
          ?.toDouble() ??
      8.0;
  double get buttonPaddingHorizontal =>
      (_config['spacing']['buttonPaddingHorizontal'] as num?)?.toDouble() ??
      24.0;
  double get buttonPaddingVertical =>
      (_config['spacing']['buttonPaddingVertical'] as num?)?.toDouble() ?? 12.0;
  double get errorIconTextSpacing =>
      (_config['spacing']['errorIconTextSpacing'] as num?)?.toDouble() ?? 20.0;
  double get errorButtonSpacing =>
      (_config['spacing']['errorButtonSpacing'] as num?)?.toDouble() ?? 20.0;
  double get drawerHeaderSpacing =>
      (_config['sizes']['drawerHeaderSpacing'] as num?)?.toDouble() ?? 10.0;

  // Sizes
  double get cardImageHeight =>
      (_config['sizes']['cardImageHeight'] as num?)?.toDouble() ?? 120.0;
  double get cardAspectRatio =>
      (_config['sizes']['cardAspectRatio'] as num?)?.toDouble() ?? 1.0;
  double get errorIconSize =>
      (_config['sizes']['errorIconSize'] as num?)?.toDouble() ?? 60.0;
  double get drawerAvatarRadius =>
      (_config['sizes']['drawerAvatarRadius'] as num?)?.toDouble() ?? 30.0;
  double get drawerAvatarIconSize =>
      (_config['sizes']['drawerAvatarIconSize'] as num?)?.toDouble() ?? 40.0;

  // Card Properties
  double get cardElevation =>
      (_config['cardProperties']['elevation'] as num?)?.toDouble() ?? 5.0;
  double get cardBorderRadius =>
      (_config['cardProperties']['borderRadius'] as num?)?.toDouble() ?? 15.0;

  // Button Properties
  double get buttonElevationDefault =>
      (_config['buttonProperties']['elevationDefault'] as num?)?.toDouble() ??
      4.0;
  double get buttonElevationPressed =>
      (_config['buttonProperties']['elevationPressed'] as num?)?.toDouble() ??
      8.0;
  double get buttonBorderRadius =>
      (_config['buttonProperties']['borderRadius'] as num?)?.toDouble() ?? 10.0;


  ConfigState getInitialConfigState() {
    return ConfigState(
      appTitle: appTitle,
      primarySwatch: primarySwatch,
      primaryColor: primaryColor,
      accentColor: accentColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarBackgroundColor: appBarBackgroundColor,
      appBarForegroundColor: appBarForegroundColor,
      cardTextColor: cardTextColor,
      expansionIconColor: expansionIconColor,
      expansionTextColor: expansionTextColor,
      expansionCollapsedIconColor: expansionCollapsedIconColor,
      expansionCollapsedTextColor: expansionCollapsedTextColor,
      buttonBackgroundColor: buttonBackgroundColor,
      buttonPressedColor: buttonPressedColor,
      buttonHoveredColor: buttonHoveredColor,
      buttonForegroundColor: buttonForegroundColor,
      errorIconColor: errorIconColor,
      errorTextColor: errorTextColor,
      appBarTitleFontSize: appBarTitleFontSize,
      cardTitleFontSize: cardTitleFontSize,
      cardCategoryFontSize: cardCategoryFontSize,
      cardShortDescriptionFontSize: cardShortDescriptionFontSize,
      cardLongDescriptionFontSize: cardLongDescriptionFontSize,
      errorTextFontSize: errorTextFontSize,
      drawerHeaderTitleSize: drawerHeaderTitleSize,
      cardMargin: cardMargin,
      gridCrossAxisSpacing: gridCrossAxisSpacing,
      gridMainAxisSpacing: gridMainAxisSpacing,
      cardImageTextSpacing: cardImageTextSpacing,
      cardTitleCategorySpacing: cardTitleCategorySpacing,
      cardBeforeExpandableSpacing: cardBeforeExpandableSpacing,
      expansionTilePaddingHorizontal: expansionTilePaddingHorizontal,
      expansionTilePaddingVertical: expansionTilePaddingVertical,
      expansionChildrenPaddingHorizontal: expansionChildrenPaddingHorizontal,
      expansionChildrenPaddingVertical: expansionChildrenPaddingVertical,
      buttonPaddingHorizontal: buttonPaddingHorizontal,
      buttonPaddingVertical: buttonPaddingVertical,
      errorIconTextSpacing: errorIconTextSpacing,
      errorButtonSpacing: errorButtonSpacing,
      drawerHeaderSpacing: drawerHeaderSpacing,
      cardImageHeight: cardImageHeight,
      cardAspectRatio: cardAspectRatio,
      errorIconSize: errorIconSize,
      drawerAvatarRadius: drawerAvatarRadius,
      drawerAvatarIconSize: drawerAvatarIconSize,
      cardElevation: cardElevation,
      cardBorderRadius: cardBorderRadius,
      buttonElevationDefault: buttonElevationDefault,
      buttonElevationPressed: buttonElevationPressed,
      buttonBorderRadius: buttonBorderRadius,
    );
  }
}
