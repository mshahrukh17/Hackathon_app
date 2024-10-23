import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade400),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200.withOpacity(0.2),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade900,
      secondary: Colors.grey.shade700),
  inputDecorationTheme: InputDecorationTheme(
      filled: true, fillColor: Colors.grey.shade900.withOpacity(0.2)),
);
