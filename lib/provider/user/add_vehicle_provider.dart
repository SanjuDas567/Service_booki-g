import 'package:flutter/material.dart';

class AddNewVehicleProvider extends ChangeNotifier {
  var _vehicleBrand;
  get vehicleBrand => _vehicleBrand;

  var _vehicleModel;
  get vehiclemodel => _vehicleModel;

  void setVehicleValue(newvalue) {
    _vehicleBrand = newvalue;
    notifyListeners();
  }

  void setVehicleModelValue(newvalue) {
    _vehicleModel = newvalue;
    notifyListeners();
  }
}
