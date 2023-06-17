import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }
}
