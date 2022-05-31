
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier{

  List<int> _selectedItemsList = [];  // create an empty list

  /// getter to get this list
  List<int> get selectedItemsList =>  _selectedItemsList;

  /// setter to add value in the list
  void addItemsToList(int indexValue){
    _selectedItemsList.add(indexValue);
    notifyListeners();
  }

  /// remove index value from the list
  void removeItemsFromList(int indexValue){
    _selectedItemsList.remove(indexValue);
    notifyListeners();
  }
}