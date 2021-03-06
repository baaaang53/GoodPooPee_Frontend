import 'package:gpp_app/constants/colors.dart';

import 'package:flutter/material.dart';

class Themes {
  Themes._();

  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    fontFamily: 'NotoSansKR',
    textTheme: textTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // Details
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    primaryColorBrightness: Brightness.light,
    accentColor: AppColors.accentColor,
    accentColorBrightness: Brightness.light,
    backgroundColor: AppColors.backgroundColor,
  );

  static const AppBarTheme appBarTheme = const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );

  static const TextTheme textTheme = const TextTheme(
    // headline : primaryColor / bold or normal
    headline1: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    headline2: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryColor,
    ),
    headline3: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    headline4: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryColor,
    ),
    headline5: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    headline6: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryColor,
    ),
    subtitle1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
    ),
    button: TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
  );
}
