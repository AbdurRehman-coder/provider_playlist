
import 'package:flutter/material.dart';

class ToggleProvider with ChangeNotifier{

  bool _passwordToggle = true;

  bool get passwordToggle => _passwordToggle;

  void setToggleValue(){
    _passwordToggle = !_passwordToggle;
    notifyListeners();
  }
}