import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert'; 
import 'package:shared_preferences/shared_preferences.dart'; 
import '../utils/app_config.dart'; 

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  @override
  List<Object> get props => [];
}

class LoadInitialConfig extends ConfigEvent {}

class UpdateColorEvent extends ConfigEvent {
  final String propertyName;
  final Color color;

  const UpdateColorEvent({required this.propertyName, required this.color});

  @override
  List<Object> get props => [propertyName, color];
}

class UpdateDoubleEvent extends ConfigEvent {
  final String propertyName;
  final double value;

  const UpdateDoubleEvent({required this.propertyName, required this.value});

  @override
  List<Object> get props => [propertyName, value];
}

class ResetConfig extends ConfigEvent {} 

class ConfigState extends Equatable {
  final String appTitle;

  final MaterialColor primarySwatch;
  final Color primaryColor;
  final Color accentColor;
  final Color scaffoldBackgroundColor;
  final Color appBarBackgroundColor;
  final Color appBarForegroundColor;
  final Color cardTextColor;
  final Color expansionIconColor;
  final Color expansionTextColor;
  final Color expansionCollapsedIconColor;
  final Color expansionCollapsedTextColor;
  final Color buttonBackgroundColor;
  final Color buttonPressedColor;
  final Color buttonHoveredColor;
  final Color buttonForegroundColor;
  final Color errorIconColor;
  final Color errorTextColor;

  // Font Sizes
  final double appBarTitleFontSize;
  final double cardTitleFontSize;
  final double cardCategoryFontSize;
  final double cardShortDescriptionFontSize;
  final double cardLongDescriptionFontSize;
  final double errorTextFontSize;
  final double drawerHeaderTitleSize;

  // Spacing
  final double cardMargin;
  final double gridCrossAxisSpacing;
  final double gridMainAxisSpacing;
  final double cardImageTextSpacing;
  final double cardTitleCategorySpacing;
  final double cardBeforeExpandableSpacing;
  final double expansionTilePaddingHorizontal;
  final double expansionTilePaddingVertical;
  final double expansionChildrenPaddingHorizontal;
  final double expansionChildrenPaddingVertical;
  final double buttonPaddingHorizontal;
  final double buttonPaddingVertical;
  final double errorIconTextSpacing;
  final double errorButtonSpacing;
  final double drawerHeaderSpacing;

  // Sizes
  final double cardImageHeight;
  final double cardAspectRatio;
  final double errorIconSize;
  final double drawerAvatarRadius;
  final double drawerAvatarIconSize;

  // Card Properties
  final double cardElevation;
  final double cardBorderRadius;

  // Button Properties
  final double buttonElevationDefault;
  final double buttonElevationPressed;
  final double buttonBorderRadius;

  const ConfigState({
    required this.appTitle,
    required this.primarySwatch,
    required this.primaryColor,
    required this.accentColor,
    required this.scaffoldBackgroundColor,
    required this.appBarBackgroundColor,
    required this.appBarForegroundColor,
    required this.cardTextColor,
    required this.expansionIconColor,
    required this.expansionTextColor,
    required this.expansionCollapsedIconColor,
    required this.expansionCollapsedTextColor,
    required this.buttonBackgroundColor,
    required this.buttonPressedColor,
    required this.buttonHoveredColor,
    required this.buttonForegroundColor,
    required this.errorIconColor,
    required this.errorTextColor,
    required this.appBarTitleFontSize,
    required this.cardTitleFontSize,
    required this.cardCategoryFontSize,
    required this.cardShortDescriptionFontSize,
    required this.cardLongDescriptionFontSize,
    required this.errorTextFontSize,
    required this.drawerHeaderTitleSize,
    required this.cardMargin,
    required this.gridCrossAxisSpacing,
    required this.gridMainAxisSpacing,
    required this.cardImageTextSpacing,
    required this.cardTitleCategorySpacing,
    required this.cardBeforeExpandableSpacing,
    required this.expansionTilePaddingHorizontal,
    required this.expansionTilePaddingVertical,
    required this.expansionChildrenPaddingHorizontal,
    required this.expansionChildrenPaddingVertical,
    required this.buttonPaddingHorizontal,
    required this.buttonPaddingVertical,
    required this.errorIconTextSpacing,
    required this.errorButtonSpacing,
    required this.drawerHeaderSpacing,
    required this.cardImageHeight,
    required this.cardAspectRatio,
    required this.errorIconSize,
    required this.drawerAvatarRadius,
    required this.drawerAvatarIconSize,
    required this.cardElevation,
    required this.cardBorderRadius,
    required this.buttonElevationDefault,
    required this.buttonElevationPressed,
    required this.buttonBorderRadius,
  });

  Map<String, dynamic> toJson() => {
    'appTitle': appTitle,
    'primarySwatch': primarySwatch.value, 
    'primaryColor': primaryColor.value,
    'accentColor': accentColor.value,
    'scaffoldBackgroundColor': scaffoldBackgroundColor.value,
    'appBarBackgroundColor': appBarBackgroundColor.value,
    'appBarForegroundColor': appBarForegroundColor.value,
    'cardTextColor': cardTextColor.value,
    'expansionIconColor': expansionIconColor.value,
    'expansionTextColor': expansionTextColor.value,
    'expansionCollapsedIconColor': expansionCollapsedIconColor.value,
    'expansionCollapsedTextColor': expansionCollapsedTextColor.value,
    'buttonBackgroundColor': buttonBackgroundColor.value,
    'buttonPressedColor': buttonPressedColor.value,
    'buttonHoveredColor': buttonHoveredColor.value,
    'buttonForegroundColor': buttonForegroundColor.value,
    'errorIconColor': errorIconColor.value,
    'errorTextColor': errorTextColor.value,
    'appBarTitleFontSize': appBarTitleFontSize,
    'cardTitleFontSize': cardTitleFontSize,
    'cardCategoryFontSize': cardCategoryFontSize,
    'cardShortDescriptionFontSize': cardShortDescriptionFontSize,
    'cardLongDescriptionFontSize': cardLongDescriptionFontSize,
    'errorTextFontSize': errorTextFontSize,
    'drawerHeaderTitleSize': drawerHeaderTitleSize,
    'cardMargin': cardMargin,
    'gridCrossAxisSpacing': gridCrossAxisSpacing,
    'gridMainAxisSpacing': gridMainAxisSpacing,
    'cardImageTextSpacing': cardImageTextSpacing,
    'cardTitleCategorySpacing': cardTitleCategorySpacing,
    'cardBeforeExpandableSpacing': cardBeforeExpandableSpacing,
    'expansionTilePaddingHorizontal': expansionTilePaddingHorizontal,
    'expansionTilePaddingVertical': expansionTilePaddingVertical,
    'expansionChildrenPaddingHorizontal': expansionChildrenPaddingHorizontal,
    'expansionChildrenPaddingVertical': expansionChildrenPaddingVertical,
    'buttonPaddingHorizontal': buttonPaddingHorizontal,
    'buttonPaddingVertical': buttonPaddingVertical,
    'errorIconTextSpacing': errorIconTextSpacing,
    'errorButtonSpacing': errorButtonSpacing,
    'drawerHeaderSpacing': drawerHeaderSpacing,
    'cardImageHeight': cardImageHeight,
    'cardAspectRatio': cardAspectRatio,
    'errorIconSize': errorIconSize,
    'drawerAvatarRadius': drawerAvatarRadius,
    'drawerAvatarIconSize': drawerAvatarIconSize,
    'cardElevation': cardElevation,
    'cardBorderRadius': cardBorderRadius,
    'buttonElevationDefault': buttonElevationDefault,
    'buttonElevationPressed': buttonElevationPressed,
    'buttonBorderRadius': buttonBorderRadius,
  };

  factory ConfigState.fromJson(Map<String, dynamic> json) {
    MaterialColor _intToMaterialColor(int value) {
      return MaterialColor(value, <int, Color>{
        50: Color(value).withOpacity(0.1),
        100: Color(value).withOpacity(0.2),
        200: Color(value).withOpacity(0.3),
        300: Color(value).withOpacity(0.4),
        400: Color(value).withOpacity(0.5),
        500: Color(value),
        600: Color(value).withOpacity(0.7),
        700: Color(value).withOpacity(0.8),
        800: Color(value).withOpacity(0.9),
        900: Color(value).withOpacity(1.0),
      });
    }

    return ConfigState(
      appTitle: json['appTitle'],
      primarySwatch: _intToMaterialColor(json['primarySwatch']),
      primaryColor: Color(json['primaryColor']),
      accentColor: Color(json['accentColor']),
      scaffoldBackgroundColor: Color(json['scaffoldBackgroundColor']),
      appBarBackgroundColor: Color(json['appBarBackgroundColor']),
      appBarForegroundColor: Color(json['appBarForegroundColor']),
      cardTextColor: Color(json['cardTextColor']),
      expansionIconColor: Color(json['expansionIconColor']),
      expansionTextColor: Color(json['expansionTextColor']),
      expansionCollapsedIconColor: Color(json['expansionCollapsedIconColor']),
      expansionCollapsedTextColor: Color(json['expansionCollapsedTextColor']),
      buttonBackgroundColor: Color(json['buttonBackgroundColor']),
      buttonPressedColor: Color(json['buttonPressedColor']),
      buttonHoveredColor: Color(json['buttonHoveredColor']),
      buttonForegroundColor: Color(json['buttonForegroundColor']),
      errorIconColor: Color(json['errorIconColor']),
      errorTextColor: Color(json['errorTextColor']),
      appBarTitleFontSize: json['appBarTitleFontSize'],
      cardTitleFontSize: json['cardTitleFontSize'],
      cardCategoryFontSize: json['cardCategoryFontSize'],
      cardShortDescriptionFontSize: json['cardShortDescriptionFontSize'],
      cardLongDescriptionFontSize: json['cardLongDescriptionFontSize'],
      errorTextFontSize: json['errorTextFontSize'],
      drawerHeaderTitleSize: json['drawerHeaderTitleSize'],
      cardMargin: json['cardMargin'],
      gridCrossAxisSpacing: json['gridCrossAxisSpacing'],
      gridMainAxisSpacing: json['gridMainAxisSpacing'],
      cardImageTextSpacing: json['cardImageTextSpacing'],
      cardTitleCategorySpacing: json['cardTitleCategorySpacing'],
      cardBeforeExpandableSpacing: json['cardBeforeExpandableSpacing'],
      expansionTilePaddingHorizontal: json['expansionTilePaddingHorizontal'],
      expansionTilePaddingVertical: json['expansionTilePaddingVertical'],
      expansionChildrenPaddingHorizontal:
          json['expansionChildrenPaddingHorizontal'],
      expansionChildrenPaddingVertical:
          json['expansionChildrenPaddingVertical'],
      buttonPaddingHorizontal: json['buttonPaddingHorizontal'],
      buttonPaddingVertical: json['buttonPaddingVertical'],
      errorIconTextSpacing: json['errorIconTextSpacing'],
      errorButtonSpacing: json['errorButtonSpacing'],
      drawerHeaderSpacing: json['drawerHeaderSpacing'],
      cardImageHeight: json['cardImageHeight'],
      cardAspectRatio: json['cardAspectRatio'],
      errorIconSize: json['errorIconSize'],
      drawerAvatarRadius: json['drawerAvatarRadius'],
      drawerAvatarIconSize: json['drawerAvatarIconSize'],
      cardElevation: json['cardElevation'],
      cardBorderRadius: json['cardBorderRadius'],
      buttonElevationDefault: json['buttonElevationDefault'],
      buttonElevationPressed: json['buttonElevationPressed'],
      buttonBorderRadius: json['buttonBorderRadius'],
    );
  }

  ConfigState copyWith({
    String? appTitle,
    MaterialColor? primarySwatch,
    Color? primaryColor,
    Color? accentColor,
    Color? scaffoldBackgroundColor,
    Color? appBarBackgroundColor,
    Color? appBarForegroundColor,
    Color? cardTextColor,
    Color? expansionIconColor,
    Color? expansionTextColor,
    Color? expansionCollapsedIconColor,
    Color? expansionCollapsedTextColor,
    Color? buttonBackgroundColor,
    Color? buttonPressedColor,
    Color? buttonHoveredColor,
    Color? buttonForegroundColor,
    Color? errorIconColor,
    Color? errorTextColor,
    double? appBarTitleFontSize,
    double? cardTitleFontSize,
    double? cardCategoryFontSize,
    double? cardShortDescriptionFontSize,
    double? cardLongDescriptionFontSize,
    double? errorTextFontSize,
    double? drawerHeaderTitleSize,
    double? cardMargin,
    double? gridCrossAxisSpacing,
    double? gridMainAxisSpacing,
    double? cardImageTextSpacing,
    double? cardTitleCategorySpacing,
    double? cardBeforeExpandableSpacing,
    double? expansionTilePaddingHorizontal,
    double? expansionTilePaddingVertical,
    double? expansionChildrenPaddingHorizontal,
    double? expansionChildrenPaddingVertical,
    double? buttonPaddingHorizontal,
    double? buttonPaddingVertical,
    double? errorIconTextSpacing,
    double? errorButtonSpacing,
    double? drawerHeaderSpacing,
    double? cardImageHeight,
    double? cardAspectRatio,
    double? errorIconSize,
    double? drawerAvatarRadius,
    double? drawerAvatarIconSize,
    double? cardElevation,
    double? cardBorderRadius,
    double? buttonElevationDefault,
    double? buttonElevationPressed,
    double? buttonBorderRadius,
  }) {
    return ConfigState(
      appTitle: appTitle ?? this.appTitle,
      primarySwatch: primarySwatch ?? this.primarySwatch,
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      appBarBackgroundColor:
          appBarBackgroundColor ?? this.appBarBackgroundColor,
      appBarForegroundColor:
          appBarForegroundColor ?? this.appBarForegroundColor,
      cardTextColor: cardTextColor ?? this.cardTextColor,
      expansionIconColor: expansionIconColor ?? this.expansionIconColor,
      expansionTextColor: expansionTextColor ?? this.expansionTextColor,
      expansionCollapsedIconColor:
          expansionCollapsedIconColor ?? this.expansionCollapsedIconColor,
      expansionCollapsedTextColor:
          expansionCollapsedTextColor ?? this.expansionCollapsedTextColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      buttonPressedColor: buttonPressedColor ?? this.buttonPressedColor,
      buttonHoveredColor: buttonHoveredColor ?? this.buttonHoveredColor,
      buttonForegroundColor:
          buttonForegroundColor ?? this.buttonForegroundColor,
      errorIconColor: errorIconColor ?? this.errorIconColor,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      appBarTitleFontSize: appBarTitleFontSize ?? this.appBarTitleFontSize,
      cardTitleFontSize: cardTitleFontSize ?? this.cardTitleFontSize,
      cardCategoryFontSize: cardCategoryFontSize ?? this.cardCategoryFontSize,
      cardShortDescriptionFontSize:
          cardShortDescriptionFontSize ?? this.cardShortDescriptionFontSize,
      cardLongDescriptionFontSize:
          cardLongDescriptionFontSize ?? this.cardLongDescriptionFontSize,
      errorTextFontSize: errorTextFontSize ?? this.errorTextFontSize,
      drawerHeaderTitleSize:
          drawerHeaderTitleSize ?? this.drawerHeaderTitleSize,
      cardMargin: cardMargin ?? this.cardMargin,
      gridCrossAxisSpacing: gridCrossAxisSpacing ?? this.gridCrossAxisSpacing,
      gridMainAxisSpacing: gridMainAxisSpacing ?? this.gridMainAxisSpacing,
      cardImageTextSpacing: cardImageTextSpacing ?? this.cardImageTextSpacing,
      cardTitleCategorySpacing:
          cardTitleCategorySpacing ?? this.cardTitleCategorySpacing,
      cardBeforeExpandableSpacing:
          cardBeforeExpandableSpacing ?? this.cardBeforeExpandableSpacing,
      expansionTilePaddingHorizontal:
          expansionTilePaddingHorizontal ?? this.expansionTilePaddingHorizontal,
      expansionTilePaddingVertical:
          expansionTilePaddingVertical ?? this.expansionTilePaddingVertical,
      expansionChildrenPaddingHorizontal:
          expansionChildrenPaddingHorizontal ??
          this.expansionChildrenPaddingHorizontal,
      expansionChildrenPaddingVertical:
          expansionChildrenPaddingVertical ??
          this.expansionChildrenPaddingVertical,
      buttonPaddingHorizontal:
          buttonPaddingHorizontal ?? this.buttonPaddingHorizontal,
      buttonPaddingVertical:
          buttonPaddingVertical ?? this.buttonPaddingVertical,
      errorIconTextSpacing: errorIconTextSpacing ?? this.errorIconTextSpacing,
      errorButtonSpacing: errorButtonSpacing ?? this.errorButtonSpacing,
      drawerHeaderSpacing: drawerHeaderSpacing ?? this.drawerHeaderSpacing,
      cardImageHeight: cardImageHeight ?? this.cardImageHeight,
      cardAspectRatio: cardAspectRatio ?? this.cardAspectRatio,
      errorIconSize: errorIconSize ?? this.errorIconSize,
      drawerAvatarRadius: drawerAvatarRadius ?? this.drawerAvatarRadius,
      drawerAvatarIconSize: drawerAvatarIconSize ?? this.drawerAvatarIconSize,
      cardElevation: cardElevation ?? this.cardElevation,
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
      buttonElevationDefault:
          buttonElevationDefault ?? this.buttonElevationDefault,
      buttonElevationPressed:
          buttonElevationPressed ?? this.buttonElevationPressed,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
    );
  }

  @override
  List<Object> get props => [
    appTitle,
    primarySwatch,
    primaryColor,
    accentColor,
    scaffoldBackgroundColor,
    appBarBackgroundColor,
    appBarForegroundColor,
    cardTextColor,
    expansionIconColor,
    expansionTextColor,
    expansionCollapsedIconColor,
    expansionCollapsedTextColor,
    buttonBackgroundColor,
    buttonPressedColor,
    buttonHoveredColor,
    buttonForegroundColor,
    errorIconColor,
    errorTextColor,
    appBarTitleFontSize,
    cardTitleFontSize,
    cardCategoryFontSize,
    cardShortDescriptionFontSize,
    cardLongDescriptionFontSize,
    errorTextFontSize,
    drawerHeaderTitleSize,
    cardMargin,
    gridCrossAxisSpacing,
    gridMainAxisSpacing,
    cardImageTextSpacing,
    cardTitleCategorySpacing,
    cardBeforeExpandableSpacing,
    expansionTilePaddingHorizontal,
    expansionTilePaddingVertical,
    expansionChildrenPaddingHorizontal,
    expansionChildrenPaddingVertical,
    buttonPaddingHorizontal,
    buttonPaddingVertical,
    errorIconTextSpacing,
    errorButtonSpacing,
    drawerHeaderSpacing,
    cardImageHeight,
    cardAspectRatio,
    errorIconSize,
    drawerAvatarRadius,
    drawerAvatarIconSize,
    cardElevation,
    cardBorderRadius,
    buttonElevationDefault,
    buttonElevationPressed,
    buttonBorderRadius,
  ];
}

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static const String _configKey = 'app_config_state';

  ConfigBloc() : super(AppConfig().getInitialConfigState()) {
    _loadSavedConfig(); 
    on<UpdateColorEvent>((event, emit) async {
      final newState = state.copyWith(
        primaryColor: event.propertyName == 'primaryColor' ? event.color : null,
        accentColor: event.propertyName == 'accentColor' ? event.color : null,
        scaffoldBackgroundColor: event.propertyName == 'scaffoldBackgroundColor'
            ? event.color
            : null,
        appBarBackgroundColor: event.propertyName == 'appBarBackgroundColor'
            ? event.color
            : null,
        appBarForegroundColor: event.propertyName == 'appBarForegroundColor'
            ? event.color
            : null,
        cardTextColor: event.propertyName == 'cardTextColor'
            ? event.color
            : null,
        expansionIconColor: event.propertyName == 'expansionIconColor'
            ? event.color
            : null,
        expansionTextColor: event.propertyName == 'expansionTextColor'
            ? event.color
            : null,
        expansionCollapsedIconColor:
            event.propertyName == 'expansionCollapsedIconColor'
            ? event.color
            : null,
        expansionCollapsedTextColor:
            event.propertyName == 'expansionCollapsedTextColor'
            ? event.color
            : null,
        buttonBackgroundColor: event.propertyName == 'buttonBackgroundColor'
            ? event.color
            : null,
        buttonPressedColor: event.propertyName == 'buttonPressedColor'
            ? event.color
            : null,
        buttonHoveredColor: event.propertyName == 'buttonHoveredColor'
            ? event.color
            : null,
        buttonForegroundColor: event.propertyName == 'buttonForegroundColor'
            ? event.color
            : null,
        errorIconColor: event.propertyName == 'errorIconColor'
            ? event.color
            : null,
        errorTextColor: event.propertyName == 'errorTextColor'
            ? event.color
            : null,
      );
      emit(newState);
      await _saveConfigState(newState);
    });

    on<UpdateDoubleEvent>((event, emit) async {
      final newState = state.copyWith(
        appBarTitleFontSize: event.propertyName == 'appBarTitleFontSize'
            ? event.value
            : null,
        cardTitleFontSize: event.propertyName == 'cardTitleFontSize'
            ? event.value
            : null,
        cardCategoryFontSize: event.propertyName == 'cardCategoryFontSize'
            ? event.value
            : null,
        cardShortDescriptionFontSize:
            event.propertyName == 'cardShortDescriptionFontSize'
            ? event.value
            : null,
        cardLongDescriptionFontSize:
            event.propertyName == 'cardLongDescriptionFontSize'
            ? event.value
            : null,
        errorTextFontSize: event.propertyName == 'errorTextFontSize'
            ? event.value
            : null,
        drawerHeaderTitleSize: event.propertyName == 'drawerHeaderTitleSize'
            ? event.value
            : null,
        cardMargin: event.propertyName == 'cardMargin' ? event.value : null,
        gridCrossAxisSpacing: event.propertyName == 'gridCrossAxisSpacing'
            ? event.value
            : null,
        gridMainAxisSpacing: event.propertyName == 'gridMainAxisSpacing'
            ? event.value
            : null,
        cardImageTextSpacing: event.propertyName == 'cardImageTextSpacing'
            ? event.value
            : null,
        cardTitleCategorySpacing:
            event.propertyName == 'cardTitleCategorySpacing'
            ? event.value
            : null,
        cardBeforeExpandableSpacing:
            event.propertyName == 'cardBeforeExpandableSpacing'
            ? event.value
            : null,
        expansionTilePaddingHorizontal:
            event.propertyName == 'expansionTilePaddingHorizontal'
            ? event.value
            : null,
        expansionTilePaddingVertical:
            event.propertyName == 'expansionTilePaddingVertical'
            ? event.value
            : null,
        expansionChildrenPaddingHorizontal:
            event.propertyName == 'expansionChildrenPaddingHorizontal'
            ? event.value
            : null,
        expansionChildrenPaddingVertical:
            event.propertyName == 'expansionChildrenPaddingVertical'
            ? event.value
            : null,
        buttonPaddingHorizontal: event.propertyName == 'buttonPaddingHorizontal'
            ? event.value
            : null,
        buttonPaddingVertical: event.propertyName == 'buttonPaddingVertical'
            ? event.value
            : null,
        errorIconTextSpacing: event.propertyName == 'errorIconTextSpacing'
            ? event.value
            : null,
        errorButtonSpacing: event.propertyName == 'errorButtonSpacing'
            ? event.value
            : null,
        drawerHeaderSpacing: event.propertyName == 'drawerHeaderSpacing'
            ? event.value
            : null,
        cardImageHeight: event.propertyName == 'cardImageHeight'
            ? event.value
            : null,
        cardAspectRatio: event.propertyName == 'cardAspectRatio'
            ? event.value
            : null,
        errorIconSize: event.propertyName == 'errorIconSize'
            ? event.value
            : null,
        drawerAvatarRadius: event.propertyName == 'drawerAvatarRadius'
            ? event.value
            : null,
        drawerAvatarIconSize: event.propertyName == 'drawerAvatarIconSize'
            ? event.value
            : null,
        cardElevation: event.propertyName == 'cardElevation'
            ? event.value
            : null,
        cardBorderRadius: event.propertyName == 'cardBorderRadius'
            ? event.value
            : null,
        buttonElevationDefault: event.propertyName == 'buttonElevationDefault'
            ? event.value
            : null,
        buttonElevationPressed: event.propertyName == 'buttonElevationPressed'
            ? event.value
            : null,
        buttonBorderRadius: event.propertyName == 'buttonBorderRadius'
            ? event.value
            : null,
      );
      emit(newState);
      await _saveConfigState(newState);
    });

    on<ResetConfig>((event, emit) async {
      final defaultState = AppConfig().getInitialConfigState();
      emit(defaultState);
      await _saveConfigState(defaultState);
    });
  }

  Future<void> _loadSavedConfig() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? savedConfigJson = prefs.getString(_configKey);
      if (savedConfigJson != null) {
        final Map<String, dynamic> jsonMap = json.decode(savedConfigJson);
        final savedState = ConfigState.fromJson(jsonMap);
        emit(savedState); 
      }
    } catch (e) {
      print('Error loading saved config: $e');
      emit(AppConfig().getInitialConfigState());
    }
  }

  Future<void> _saveConfigState(ConfigState configState) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String configJson = json.encode(configState.toJson());
      await prefs.setString(_configKey, configJson);
    } catch (e) {
      print('Error saving config: $e');
    }
  }
}
