import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/service_type_model.dart';
import 'package:glossy_flossy/provider/user/repo/home_screen_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/images.dart';

class HomeScreenProvider extends ChangeNotifier {
  final HomeScreenRepo homeScreenRepo;
  HomeScreenProvider({required this.homeScreenRepo});

  List imagesForSlider = [
    Images.CAR_WASHING,
    Images.CARPET_CLEANING,
    Images.GUTTER_CLEANING,
    Images.INTERIOR_CAR_CLEANING,
    Images.SOFA_CLEANING,
    Images.WINDOW_CLEANIG,
  ];

  ServiceTypeModel? serviceTypeModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getServiceType() async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await homeScreenRepo.getServiceType();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _isLoading = false;
      print(apiResponse);
      print('inside 200 service provider');

      final serviceType = ServiceTypeModel.fromJson(apiResponse.response!.data);
      serviceTypeModel = serviceType;
      print("service type : ${serviceType.data[1].serviceType}");
    }
    notifyListeners();
  }

  // Service type
}
