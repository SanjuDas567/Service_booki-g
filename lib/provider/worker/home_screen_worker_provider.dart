import 'package:flutter/material.dart';

class HomeScreenProviderWorker extends ChangeNotifier {
  late Future<TimeOfDay?> selectedTime;
  String time = "";

  void setTime(String value) {
    time = value;
    notifyListeners();
  }
}
