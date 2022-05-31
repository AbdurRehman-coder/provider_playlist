
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _count = 0;
  /// getter
  int get count => _count;

  void setCount(){
    _count++;
    notifyListeners();
  }
}