import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/form_data/otp_mobile_form_data.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_register_model.dart';
import 'package:glossy_flossy/models/worker/worker_register_responce_model.dart';
import 'package:glossy_flossy/provider/worker/repo/register_screen_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:image_picker/image_picker.dart';

class RegisterWorkerProvider extends ChangeNotifier {
  final WorkerRegisterRepo workerRegisterRepo;
  RegisterWorkerProvider({required this.workerRegisterRepo});

  TextEditingController avilTimeInputController = TextEditingController();
  TextEditingController avilToTimeInputController = TextEditingController();

  void setTimeInput(String time) {
    avilTimeInputController.text = time;
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

  void setToTimeInput(String time) {
    avilToTimeInputController.text = time;
    notifyListeners();
  }

  Future<void> selectToTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
      setToTimeInput(formattedTime);
    }
  }

  bool _isRegistrationLoading = false;
  bool get isRegistrationLoading => _isRegistrationLoading;

  WorkerRegisterResponseModel? workerRegisterResponseModel;

  Future<void> workerRegistration(
    WorkerRegistrationModel workerRegistrationModel,
    Function callback,
    // File images
  ) async {
    _isRegistrationLoading = true;
    notifyListeners();
    try {
      print("inside provider - worker register");
      ApiResponse apiResponse =
          await workerRegisterRepo.workerRegister(workerRegistrationModel,
          _profileImage!);
      _isRegistrationLoading = false;
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        print("inside work reg 200");
        final workerRegisterResponse =
            WorkerRegisterResponseModel.fromJson(apiResponse.response?.data);
        workerRegisterResponseModel = workerRegisterResponse;
        callback(true, workerRegisterResponseModel!.message);
        notifyListeners();
        // avilTimeInputController.clear();
        // avilToTimeInputController.clear();
      } else {
        print(apiResponse.error.toString());
      }
    } catch (e) {}
    notifyListeners();
  }

  //Image picker
  File? _profileImage;
  File? get profileImage => _profileImage;

  void clearImage() {
    _profileImage = null;
    // notifyListeners();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null) {
      _profileImage = File(pickedImage.path);
      notifyListeners();
    }
  }

  // otp verify check box:---------------------------------------------------------------------
  bool verifyOtp = false;

    bool _isVerifyLoading = false;
  bool get isVerifyLoading => _isVerifyLoading;

   bool _isVerifyLoading2 = false;
  bool get isVerifyLoading2 => _isVerifyLoading2;

  void updateOtpValue (bool value) {
    verifyOtp = value;
    notifyListeners();
  }

    Future<void> sendPhoneNumberOtp(OtpPhoneNum pNumber, Function callback) async {
      _isVerifyLoading = true;
      notifyListeners();
      try {
        ApiResponse apiResponse = await workerRegisterRepo.sendPhoneNumber(pNumber);
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
        ApiResponse apiResponse = await workerRegisterRepo.verifyPhoneNumber(otpVerify);
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
        ApiResponse apiResponse = await workerRegisterRepo.sendPhoneNumber(otpVerify);
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
