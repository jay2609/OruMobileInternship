// ignore: file_names
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(156, 32, 34, 51),
    buttonTheme:
        const ButtonThemeData(buttonColor: Color.fromRGBO(44, 47, 69, 100)),
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromRGBO(44, 47, 69, 100)),
    colorScheme: const ColorScheme.light().copyWith(
      secondary: const Color.fromRGBO(
          255, 255, 255, 100), // Use 'secondary' property for the accent color
    ),
    // Add other theme properties as needed
  );
}
