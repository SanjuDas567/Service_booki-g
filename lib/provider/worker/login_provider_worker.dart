import 'package:flutter/material.dart';

class LoginProviderWorker extends ChangeNotifier {
  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }
}
