import 'package:flutter/material.dart';

// Define your primary colors
const Color primaryColor1 = Color.fromARGB(225, 144, 220, 177);
const Color primaryColor2 = Color.fromARGB(255, 21, 83, 67);
const Color primaryColor3 = Colors.white;

// Define your theme
final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor1,
  hintColor: primaryColor2,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: primaryColor1,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith(
          (states) => primaryColor1), // Use primaryColor2 as the button color
    ),
  ),
);
