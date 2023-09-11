import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final isdark="isdark";
ThemeMode themeMode=ThemeMode.light;
bool get isDarkMode=>themeMode ==ThemeMode.light;

 ThemeProvider() {
    notifyListeners();
    getTheme();
  }

  Future<void> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final isDarkTheme = pref.getBool(isdark);
    if (isDarkTheme != null) {
      themeMode = isDarkTheme ? ThemeMode.light : ThemeMode.dark;
    }
    notifyListeners();
  }

  void switchtheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(isdark, themeMode == ThemeMode.light);
    
  }
}

