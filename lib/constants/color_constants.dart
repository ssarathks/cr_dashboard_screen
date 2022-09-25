import 'package:flutter/material.dart';

class ColorConstants {
  static const Color lightThemeScaffoldColor =
      Color.fromARGB(255, 236, 236, 236);
  static const Color darkThemeScaffoldColor = Color.fromARGB(255, 80, 80, 80);

  static const Color titleTextColor = Color.fromARGB(255, 197, 195, 74);

  static Color getScaffoldColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkThemeScaffoldColor
        : lightThemeScaffoldColor;
  }
}
