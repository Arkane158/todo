import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0xFFDFECDB);
  static const Color lightUnSelectedBottmItem = Color(0xFFC8C9CB);
  static const Color darkThemeScaffoldBackground = Color(0xff060E1E);
  static const Color darkThemeSecondaryColor = Color.fromARGB(255, 31, 44, 72);

  static final lightTheme = ThemeData(
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: lightPrimary),
      primaryColor: lightPrimary,
      focusColor: lightPrimary,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.white, background: Colors.black),
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
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
              color: lightPrimary, fontSize: 21, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)));

  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: darkThemeSecondaryColor, background: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: darkThemeSecondaryColor),
      primaryColor: lightPrimary,
      appBarTheme: const AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
      scaffoldBackgroundColor: darkThemeScaffoldBackground,
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
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: lightPrimary, fontSize: 21, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)));
}
