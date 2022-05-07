import 'package:flutter/material.dart';

class DarkMode extends ChangeNotifier {
  static ThemeMode toggleTheme(int isOn) {
    ThemeMode themeMode = ThemeMode.system;
    switch (isOn) {
      case 0:
        themeMode = ThemeMode.system;
        break;
      case 1:
        themeMode = ThemeMode.dark;
        break;
      case 2:
        themeMode = ThemeMode.light;
        break;
      default:
    }
    return themeMode;
  }
}
