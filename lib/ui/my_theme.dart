import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0xFFDFECDB);
  static const Color lightUnSelectedBottmItem = Color(0xFFC8C9CB);

  static final lightTheme = ThemeData(
      primaryColor: lightPrimary,
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
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
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)))),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              color: lightPrimary, fontSize: 20, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: lightPrimary, fontSize: 20, fontWeight: FontWeight.w400)));
}
