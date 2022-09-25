import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_constants.dart';

class ThemeConstants {
  static double scaffoldHorizontalPadding = 10;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.lightThemeScaffoldColor,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(bodySmall: TextStyle(color: Colors.white)),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light)),
    cardTheme: const CardTheme(color: Colors.black),
    scaffoldBackgroundColor: ColorConstants.darkThemeScaffoldColor,
  );
}
