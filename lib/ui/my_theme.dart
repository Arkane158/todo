import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xFF5D9CEC);
  static const Color scaffoldBackground = Color(0xFFDFECDB);

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimary,
    ),
    scaffoldBackgroundColor: scaffoldBackground,
  );
}
