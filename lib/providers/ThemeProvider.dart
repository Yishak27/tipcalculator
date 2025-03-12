import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkTheme = false;
  void toggleDarkTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  ThemeData getTheme() {
    return isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }
}
