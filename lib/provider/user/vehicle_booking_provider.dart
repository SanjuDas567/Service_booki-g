import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/vehicle_service_type_model.dart';
import 'package:glossy_flossy/provider/user/repo/vehicle_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class VehicleBookingProvider extends ChangeNotifier {
  VehicleRepo vehicleRepo;
  VehicleBookingProvider({required this.vehicleRepo});

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;

  // update fuction :-------------------------------------------------------------
  void updateCheckbox1(bool value) {
    checkbox1 = value;
    notifyListeners();
  }

  void updateCheckbox2(bool value) {
    checkbox2 = value;
    notifyListeners();
  }

  void updateCheckbox3(bool value) {
    checkbox3 = value;
    notifyListeners();
  }

  void updateCheckbox4(bool value) {
    checkbox4 = value;
    notifyListeners();
  }

  void updateCheckbox5(bool value) {
    checkbox5 = value;
    notifyListeners();
  }
  // update fuction :----------------------------------------------------------

  //  Api Calling :-------------------------------------------------------------
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  VehicleServiceTypeModel? vehicleServiceTypeModel;

  Future<void> getServiceName(String serviceId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await vehicleRepo.getServiceName(serviceId);
    _isLoading = false;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print('inside vehicle 200');
      print(apiResponse.response!.data);

      final vehicleServiceType =
          VehicleServiceTypeModel.fromJson(apiResponse.response!.data);
      vehicleServiceTypeModel = vehicleServiceType;
    }
    notifyListeners();
  }
}
