// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_login_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class AuthWorkerRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthWorkerRepo({
    required this.dioClient,
    required this.sharedPreferences,
  });

  Future<ApiResponse> workerLogin(LoginModelWorker loginModelWorker) async {
    try {
      Response response = await dioClient.post(
        AppConstants.WORKER_LOGIN_URI,
        data: loginModelWorker.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveWorkerToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getWorkerToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  Future<void> saveWorkerName(String workerName) {
    return sharedPreferences.setString(AppConstants.USER_NAME, workerName);
  }

  String getWorkerName() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }

  Future<void> saveWorkerId(String workerId) {
    return sharedPreferences.setString(AppConstants.USER_ID, workerId);
  }

  String getWorkerId() {
    return sharedPreferences.getString(AppConstants.USER_ID) ?? "";
  }

  Future<void> saveWorkerType(String workerType) {
    return sharedPreferences.setString(
        AppConstants.USER_TYPE.toString(), workerType);
  }

  String getWorkerType() {
    return sharedPreferences.getString(AppConstants.USER_TYPE.toString()) ?? "";
  }

  Future<bool> clearAllWorkerData() async {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.USER_ID);
    sharedPreferences.remove(AppConstants.USER_NAME);
    sharedPreferences.remove(AppConstants.USER_TYPE);

    return true;
  }
}
