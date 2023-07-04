import 'package:flutter/material.dart';

class ReviewProvider extends ChangeNotifier {
  var _selectedValue1;
  get selectedValue => _selectedValue1;

  void onChange1(int value) {
    _selectedValue1 = value;
    notifyListeners();
  }
}
