import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/otp_mobile_form_data.dart';
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

  bool _isVerifyLoading = false;
  bool get isVerifyLoading => _isVerifyLoading;

   bool _isVerifyLoading2 = false;
  bool get isVerifyLoading2 => _isVerifyLoading2;

  UserRegisterResponseModel? responseData;

  //Image picker
  File? _profileImage;

  File? get profileImage => _profileImage;

   clearImageUser() {
    _profileImage = null;
    // notifyListeners();
  }

  
  Future<void> pickImage( Function callback) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final File selectedImage = File(pickedImage.path);
      
      // Check the size of the selected image
      final int maxSizeInBytes = 10 * 1024 * 1024; // 10 MB
      final int imageSize = await selectedImage.length();
      
      if (imageSize <= maxSizeInBytes) {
        _profileImage = selectedImage;
        notifyListeners();
      } else {
        // Show an error message or handle the oversized image
        // You can display a snackbar, dialog, or any other UI element here
        print('Image size exceeds the 10 MB limit.');
        callback(false, 'Image size exceeds the 10 MB limit.');
        notifyListeners();
      }
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

    // otp verify check box:---------------------------------------------------------------------
  bool verifyOtp = false;

  void disposeOtpValue(bool value) {
    verifyOtp = value;
  }

  void updateOtpValue (bool value) {
    verifyOtp = value;
    notifyListeners();
  }

    Future<void> sendPhoneNumberOtp(OtpPhoneNum pNumber, Function callback) async {
      _isVerifyLoading = true;
      notifyListeners();
      try {
        ApiResponse apiResponse = await registerRepo.sendPhoneNumber(pNumber);
        _isVerifyLoading = false;
        if(apiResponse.response != null &&
          apiResponse.response!.statusCode == 200){
            // final message = apiResponse.response!.data;
            startTimer();
            callback(true, apiResponse.response!.data['message']);
            notifyListeners();
          }
      } catch (e) {
        
      }
      notifyListeners();
    }

    Future<void> verifyPhoneNumber(OtpVerify otpVerify, Function callback) async {
      _isVerifyLoading2 = true;
      notifyListeners();
      try {
        ApiResponse apiResponse = await registerRepo.verifyPhoneNumber(otpVerify);
        _isVerifyLoading2 = false;
        if(apiResponse.response != null &&
          apiResponse.response!.statusCode == 200){
            // final message = apiResponse.response!.data;
            callback(true, apiResponse.response!.data['message']);
            notifyListeners();
          } else if (apiResponse.response!.statusCode == 500) {
            callback(false, apiResponse.response!.data['error']);
            notifyListeners();
          } else if (apiResponse.response!.statusCode == 401) {
            callback(false, apiResponse.response!.data['error']);
            notifyListeners();
          }else if (apiResponse.response!.statusCode == 203) {
            callback(false, apiResponse.response!.data['error']);
            notifyListeners();
          }
      } catch (e) {
        
      }
      notifyListeners();
    }
// resent otp function :--------------------------------------------------------------------

int _timerSeconds = 0; // Initial countdown time in seconds
  bool _resendButtonEnabled = true;
  late Timer _timer;
  Timer get timer => _timer;

  int get timerSeconds => _timerSeconds;
  bool get resendButtonEnabled => _resendButtonEnabled;

  void startTimer() {
    _resendButtonEnabled = false;
    _timerSeconds = 60;
    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        _timerSeconds--;
        notifyListeners();
      } else {
        _resendButtonEnabled = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }


    bool _resendLoading = false;
    bool get resendEnabled => _resendLoading; 

    Future<void> resendOtp(OtpPhoneNum otpVerify, Function callback) async {
      _resendLoading = true;
      notifyListeners();
      try {
        ApiResponse apiResponse = await registerRepo.sendPhoneNumber(otpVerify);
        _resendLoading = false;
        if(apiResponse.response != null &&
          apiResponse.response!.statusCode == 200){
            
            startTimer();
            callback(true, apiResponse.response!.data['message']);
            notifyListeners();
          }
      } catch (e) {
        
      }
      notifyListeners();
    }
  

  // otp verify check box:---------------------------------------------------------------------


}
