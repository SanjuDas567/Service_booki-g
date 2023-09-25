import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/common/service_booking_response_model.dart';
import 'package:glossy_flossy/models/user/commercial_service_type_model.dart';
import 'package:glossy_flossy/models/user/form_data/commercial_booking_response.dart';
import 'package:glossy_flossy/provider/user/repo/commercial_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:image_picker/image_picker.dart';

class CommercialBookingProvider extends ChangeNotifier {
  final CommercialRepo commercialRepo;
  CommercialBookingProvider({required this.commercialRepo});

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;
  bool checkbox6 = false;

  dynamic sofaValetAmt = 0;
  dynamic carpetCleanAmt = 0;
  dynamic stainRemovalAmt = 0;
  dynamic windowCleaningAmt = 0;
  dynamic gutteringCleaningAmt = 0;
  dynamic driveWayAmt = 0;

// update fuction :-------------------------------------------------------------
  
   dynamic commercialTotalAmount = 0;

  void clearCommercialTotalAmt() {
    commercialTotalAmount = 0;
  }

  void updateSofaValetAmt(dynamic value) {
    sofaValetAmt = value;
    checkbox1 
    ? commercialTotalAmount += sofaValetAmt
    : commercialTotalAmount -= sofaValetAmt;
    notifyListeners();
  }

  void updateCarpetCleanAmt(dynamic value) {
    carpetCleanAmt = value;
    checkbox2 
    ? commercialTotalAmount += carpetCleanAmt
    : commercialTotalAmount -= carpetCleanAmt;
    notifyListeners();
  }

  void updateStainRemovalAmt(dynamic value) {
    stainRemovalAmt = value;
    checkbox3 
    ? commercialTotalAmount += stainRemovalAmt
    : commercialTotalAmount -= stainRemovalAmt;
    notifyListeners();
  }

  void updateWindowCleaningAmt(dynamic value) {
    windowCleaningAmt = value;
    checkbox4 
    ? commercialTotalAmount += windowCleaningAmt
    : commercialTotalAmount -= windowCleaningAmt;
    notifyListeners();
  }

  void updateGutteringCleaningAmt(dynamic value) {
    gutteringCleaningAmt = value;
    checkbox5 
    ? commercialTotalAmount += gutteringCleaningAmt
    : commercialTotalAmount -= gutteringCleaningAmt;
    notifyListeners();
  }

   void updateDriveWayAmt(dynamic value) {
    driveWayAmt = value;
    checkbox6 
    ? commercialTotalAmount += driveWayAmt
    : commercialTotalAmount -= driveWayAmt;
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

  void updateCheckbox6(bool value) {
    checkbox6 = value;
    notifyListeners();
  }

// update fuction :-------------------------------------------------------------

// clear image list fuction :---------------------------------------------------

  void clearSofaValetImage() {
    _sofaValetImages = [];
  }

  void clearcarpetImages() {
    _carpetCleanImages = [];
  }

  void clearStainImages() {
    _stainRemovalImages = [];
  }

  void clearWindowImages() {
    _windowCleaningImages = [];
  }

  void clearGuteringCleaningImages() {
    _guteringCleaningImages = [];
  }

  void clearDrivewayImages() {
    _drivewayImages = [];
  }

// clear image list fuction :---------------------------------------------------

// Oncheck : -------------------------------------------------------------------
  int? sofaId;
  int? carpetId;
  int? stainId;
  int? windowId;
  int? gutterId;
  int? drivewayId;

  void setSofaId(int value) {
    sofaId = value;
  }

  void setCarpetId(int value) {
    carpetId = value;
  }

  void setStainId(int value) {
    stainId = value;
  }

  void setWindowId(int value) {
    windowId = value;
  }

  void setGutterId(int value) {
    gutterId = value;
  }

  void setDrivewayId(int value) {
    drivewayId = value;
  }
// Oncheck : -------------------------------------------------------------------

// image upload field  :--------------------------------------------------------

  List<File> _sofaValetImages = [];
  List<File> get sofaValetImages => _sofaValetImages;

  Future<void> selectImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _sofaValetImages = selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  List<File> _carpetCleanImages = [];
  List<File> get carpetCleanImages => _carpetCleanImages;

  Future<void> selectcarpetImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _carpetCleanImages =
          selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  List<File> _stainRemovalImages = [];
  List<File> get stainRemovalImages => _stainRemovalImages;

  Future<void> selectStainImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _stainRemovalImages =
          selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  List<File> _windowCleaningImages = [];
  List<File> get windowCleaningImages => _windowCleaningImages;

  Future<void> selectWindowImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _windowCleaningImages =
          selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  List<File> _guteringCleaningImages = [];
  List<File> get guteringCleaningImages => _guteringCleaningImages;

  Future<void> selectGuteringCleaningImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _guteringCleaningImages =
          selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  List<File> _drivewayImages = [];
  List<File> get drivewayImages => _drivewayImages;

  Future<void> selectDrivewayImages() async {
    final List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    if (selectedFiles != null) {
      _drivewayImages = selectedFiles.map((file) => File(file.path)).toList();
      notifyListeners();
    }
  }

  // Api calling :--------------------------------------------------------------

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  CommercialServiceTypeModel? commercialServiceTypeModel;

  Future<void> getServiceName(String serviceId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await commercialRepo.getServiceName(serviceId);
    _isLoading = false;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print('inside commercial 200');
      print(apiResponse.response!.data);

      final commercialServiceType =
          CommercialServiceTypeModel.fromJson(apiResponse.response!.data);
      commercialServiceTypeModel = commercialServiceType;
    }
    notifyListeners();
  }

  // commercial booking api :----------------------------------------------------

   bool _isBookingLoading = false;
  bool get isBookingLoading => _isBookingLoading;

  ServiceBookingResponse? commercialBookingResponse;

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

  Future<void> houseKeepBooking(CommercialBookingModel commercialBookingModel,
      Function callback, BuildContext context) async {
    try {
      _isBookingLoading = true;
      notifyListeners();
      ApiResponse apiResponse = await commercialRepo.houseKeepBooking(
          commercialBookingModel);
      _isBookingLoading = false;
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        print('inside house keep booking 200');
        final houseKeepResponsedata =
            ServiceBookingResponse.fromJson(apiResponse.response!.data);

        commercialBookingResponse = houseKeepResponsedata;
        print(commercialBookingResponse!.message);

        callback(true, commercialBookingResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
