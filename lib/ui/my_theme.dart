import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0xFFDFECDB);
  static const Color lightUnSelectedBottmItem = Color(0xFFC8C9CB);

  static final lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: const AppBarTheme(centerTitle: true),
      scaffoldBackgroundColor: lightScaffoldBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: lightPrimary, size: 35),
        unselectedIconTheme:
            IconThemeData(color: lightUnSelectedBottmItem, size: 25),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)));
}
