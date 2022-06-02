
  import 'package:flutter/material.dart';

class ThemeChangerProvider extends ChangeNotifier{
  /// initial theme mode is light
  var _themeMode = ThemeMode.light;
  /// getter for theme data
  ThemeMode get themeMode => _themeMode;
  /// set theme mode
  void setThemeMode(ThemeMode value){
    _themeMode = value;
    notifyListeners();
  }
}