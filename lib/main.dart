import 'package:flutter/material.dart';
import 'package:pomodororeyistasakli/screens/home.dart';
import 'package:pomodororeyistasakli/themes/themes.dart';
import '../utils/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro baba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: PomoAppThemes.allTime,
      ),
      home: const PomoHome(),
      themeMode: BottomNavBarSettingsButton.themeMode,
      darkTheme: ThemeData.dark(),
    );
  }
}
