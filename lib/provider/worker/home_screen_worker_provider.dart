import 'package:flutter/material.dart';

class HomeScreenProviderWorker extends ChangeNotifier {

  bool _onlineSwitch = false;
  bool  get onlineSwitch => _onlineSwitch;

  void updateOnlineSwitchValue(bool switchValue) {
    _onlineSwitch = switchValue;
    notifyListeners();
  }
  
  late Future<TimeOfDay?> selectedTime;
  String time = "";

  void setTime(String value) {
    time = value;
    notifyListeners();
  }
}
