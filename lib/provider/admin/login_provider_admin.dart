import 'package:flutter/material.dart';

class LoginProviderAdmin extends ChangeNotifier {
  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }
}
