import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/user_data.dart';
import 'package:glossy_flossy/models/user/user_registration_response.dart';
import 'package:glossy_flossy/provider/user/repo/register_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  final RegisterRepo registerRepo;

  UserProvider({required this.registerRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserRegisterResponseModel? responseData;

  //Image picker
  File? _profileImage;

  File? get profileImage => _profileImage;

  void clearImageUser() {
    _profileImage = null;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _profileImage = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future userRegistration(
      UserRegistration userRegistration, Function callback) async {
    _isLoading = true;
    notifyListeners();
    print('registration provider');
    ApiResponse apiResponse =
        await registerRepo.registerUser(userRegistration, _profileImage!);
    _isLoading = false;
    if (apiResponse.response?.statusCode == 200) {
      print("inside responce 200");
      final data = apiResponse.response!.data;
      print(data);
      final userRegisterResponse = userRegisterResponseFromJson(data);
      responseData = userRegisterResponse;
      // print(userRegisterResponse.message.toString());
      callback(true, responseData!.message.toString());
      notifyListeners();
    } else if (apiResponse.response?.statusCode == 203) {
      print('Inside status code 203');
      callback(false, 'Email is already exist');
    } else {
      print(apiResponse.error.toString());
    }
    notifyListeners();
  }
}
