import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeData.dart';


class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false; 

  ThemeData get themeData => _isDarkMode ? darkMode : lightMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode; 
    notifyListeners(); 
  }
}
