import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/house_keeping_booking_response.dart';
import 'package:glossy_flossy/models/user/house_keep_booking_response_model.dart';
import 'package:glossy_flossy/models/user/house_keeping_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:image_picker/image_picker.dart';

import 'repo/house_keeping_repo.dart';

class HouseKeepingProvider extends ChangeNotifier {
  final HouseKeepingRepo houseKeepingRepo;
  HouseKeepingProvider({required this.houseKeepingRepo});

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;
  bool checkbox6 = false;

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

  HouseKeepingTypeModel? houseServiceTypeModel;

  Future<void> getServiceName(String serviceId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await houseKeepingRepo.getServiceName(serviceId);
    _isLoading = false;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print('inside commercial 200');
      print(apiResponse.response!.data);

      final commercialServiceType =
          HouseKeepingTypeModel.fromJson(apiResponse.response!.data);
      houseServiceTypeModel = commercialServiceType;
    }
    notifyListeners();
  }

// house keep booking api :-----------------------------------------------------

  bool _isBookingLoading = false;
  bool get isBookingLoading => _isBookingLoading;

  HouseKeepResponse? houseKeepResponse;

  Future<void> houseKeepBooking(HouseKeepBookingModel houseKeepBookingModel,
      Function callback, BuildContext context) async {
    // try {
      _isBookingLoading = true;
      notifyListeners();
      ApiResponse apiResponse = await houseKeepingRepo.houseKeepBooking(
          houseKeepBookingModel, context);
      _isBookingLoading = false;
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        print('inside house keep booking 200');
        final houseKeepResponsedata =
            HouseKeepResponse.fromJson(apiResponse.response!.data);

        houseKeepResponse = houseKeepResponsedata;
        print(houseKeepResponse!.message);

        callback(true, houseKeepResponse!.message);
        notifyListeners();
      }
    // } catch (e) {
    //   print(e);
    // }
    notifyListeners();
  }
}
