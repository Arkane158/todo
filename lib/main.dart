import 'package:flutter/material.dart';
import 'package:todo/ui/home/home_screen.dart';
import 'package:todo/ui/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      routes: {
        HomeScreen.screenName :(context) => const HomeScreen()
      },
      initialRoute: HomeScreen.screenName ,
      theme:MyTheme.lightTheme ,
    );
  }
}
