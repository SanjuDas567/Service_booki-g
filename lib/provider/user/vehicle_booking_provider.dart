import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/vehicle_service_booking.dart';
import 'package:glossy_flossy/models/common/service_booking_response_model.dart';
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

   dynamic washAndWax = 0;
   dynamic fullVelet = 0;
   dynamic interiorValet = 0;
   dynamic fullDetail = 0;
   dynamic engineSteamWash = 0;

   

  // update function :-------------------------------------------------------------

  dynamic totalAmount = 0;

  void clearTotalAmount() {
    totalAmount = 0;
  }

  void updateWashAndWax(dynamic value) {
    washAndWax = value;
    checkbox1 
    ? totalAmount += washAndWax
    : totalAmount -= washAndWax;
    notifyListeners();
  }

  void updateFullVelet(dynamic value) {
    fullVelet = value;
     checkbox2 
    ? totalAmount += fullVelet
    : totalAmount -= fullVelet;
    notifyListeners();
  }

  void updateInteriorValet(dynamic value) {
    interiorValet = value;
     checkbox3 
    ? totalAmount += interiorValet
    : totalAmount -= interiorValet;
    notifyListeners();
  }

  void updateFullDetail(dynamic value) {
    fullDetail = value;
    checkbox4 
    ? totalAmount += fullDetail
    : totalAmount -= fullDetail;
    notifyListeners();
  }

  void updateEngineSteamWash(dynamic value) {
    engineSteamWash = value;
     checkbox5 
    ? totalAmount += engineSteamWash
    : totalAmount -= engineSteamWash;
    notifyListeners();
  }

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
  // update function :----------------------------------------------------------

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

  // vehicle wash booking api :--------------------------------------------------
  bool _vehicleBookingLoading = false;
  bool get vehicleBookingLoading => _vehicleBookingLoading;

  ServiceBookingResponse? vehicleServiceResponse;

  TextEditingController servicetime = TextEditingController();

  void setTimeInput(String time) {
    servicetime.text = time;
    notifyListeners();
  }

  removeTime() {
    servicetime.clear();
    notifyListeners();
  }

   Future<void> selectTime(BuildContext context) async { 
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
      setTimeInput(formattedTime);
    }
  }
  
  Future<void> vehicleWashBooking(VehicleServiceBookingModel vehicleServiceBookingModel, Function callback) async {

      try {
        _vehicleBookingLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await vehicleRepo.vehicleServiceBooking( vehicleServiceBookingModel);
    _vehicleBookingLoading = false;
    if(apiResponse.response != null &&
      apiResponse.response!.statusCode == 200) {
        final houseKeepResponsedata =
            ServiceBookingResponse.fromJson(apiResponse.response!.data);
        vehicleServiceResponse = houseKeepResponsedata;
        print(vehicleServiceResponse!.message);

        callback(true, vehicleServiceResponse!.message);
        notifyListeners();
      }
        
      } catch (e) {
        print(e);
      }
      notifyListeners();

  }
}
