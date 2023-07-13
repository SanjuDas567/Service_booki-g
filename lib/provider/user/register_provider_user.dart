import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/user_registration_model.dart';
import 'package:glossy_flossy/models/user/user_registration_response.dart';
import 'package:glossy_flossy/provider/user/repo/register_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class UserProvider extends ChangeNotifier {
  final RegisterRepo registerRepo;

  UserProvider({required this.registerRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserRegisterResponseModel? responseData;

  Future userRegistration(UserRegistrationModel userRegistrationModel, Function callback) async {
    _isLoading = true;
    notifyListeners();
    print('registration provider');
    ApiResponse apiResponse =
        await registerRepo.registerUser(userRegistrationModel);
    _isLoading = false;
    if (apiResponse.response?.statusCode == 200) {
      print("inside responce 200");
      final data = apiResponse.response!.data;
      print(data);
      final userRegisterResponse = UserRegisterResponseModel.fromJson(data);
      responseData = userRegisterResponse;
      // print(userRegisterResponse.message.toString());
      callback(true, responseData!.message.toString());
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
    notifyListeners();
  }
}
