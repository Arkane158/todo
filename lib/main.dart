import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/ui/home/home_screen.dart';
import 'package:todo/ui/home/settings/settings_tab.dart';
import 'package:todo/ui/home/tasks_list/tasks_tab.dart';
import 'package:todo/ui/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.screenName: (_) => const HomeScreen(),
        TasksTab.screenName: (_) => const TasksTab(),
        SettingsTab.screenName: (_) => const SettingsTab(),
      },
      initialRoute: HomeScreen.screenName,
      theme: MyTheme.lightTheme,
    );
  }
}
