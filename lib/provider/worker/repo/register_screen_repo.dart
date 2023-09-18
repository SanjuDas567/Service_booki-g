import 'dart:io';

import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/form_data/otp_mobile_form_data.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_register_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class WorkerRegisterRepo {
  final DioClient dioClient;

  WorkerRegisterRepo({required this.dioClient});
  Future<ApiResponse> workerRegister(
    WorkerRegistrationModel workerRegistrationModel,
    File image,
  ) async {
    FormData formData = FormData.fromMap({
      'emp_firstname': workerRegistrationModel.empFirstname,
      'emp_lastname': workerRegistrationModel.empLastname,
      'emp_phone': workerRegistrationModel.empPhone,
      'emp_address': workerRegistrationModel.empAddress,
      'emp_email': workerRegistrationModel.empEmail,
      'emp_password': workerRegistrationModel.empPassword,
      'app_user': 2,
      'trining_course': workerRegistrationModel.triningCourse,
      'isuence_id': workerRegistrationModel.isuenceId,
      'experience': workerRegistrationModel.experience,
      'work_avl_to': workerRegistrationModel.workAvlTo,
      'WorkAvl_from': workerRegistrationModel.workAvlFrom,
      'emp_location': workerRegistrationModel.empLocation,
      "emp_profile_pic": await MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last),
    });
    try {
      print("/*********************/");
      print("emp_firstname: ${workerRegistrationModel.empFirstname}");
      print("emp_lastname: ${workerRegistrationModel.empLastname}");
      print("emp_phone: ${workerRegistrationModel.empPhone}");
      print("emp_address: ${workerRegistrationModel.empAddress}");
      print("emp_location: ${workerRegistrationModel.empLocation}");
      print("WorkAvl_from: ${workerRegistrationModel.workAvlFrom}");
      print("work_avl_to: ${workerRegistrationModel.workAvlTo}");
      print("experience: ${workerRegistrationModel.experience}");
      print("isuence_id: ${workerRegistrationModel.isuenceId}");
      print("trining_course: ${workerRegistrationModel.triningCourse}");
      print("emp_password: ${workerRegistrationModel.empPassword}");
      print("emp_email: ${workerRegistrationModel.empEmail}");
      print("/*********************/");
      final response = await dioClient.post(
          AppConstants.WORKER_REGISTRATION_URI,
          data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e);
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

   Future<ApiResponse> sendPhoneNumber(OtpPhoneNum pNumber) async {
    try {
      final response = await dioClient.post(
        AppConstants.USER_SECTION_SEND_OTP_URI,
        data: pNumber.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyPhoneNumber(OtpVerify otpVerify) async {
    try {
      final response = await dioClient.post(
        AppConstants.USER_SECTION_VERIFY_OTP_URI,
        data: otpVerify.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
