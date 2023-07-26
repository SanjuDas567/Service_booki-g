// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/login_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class AuthRepoUser {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepoUser({
    required this.dioClient,
    required this.sharedPreferences,
  });

  Future<ApiResponse> login(LoginModel loginBody) async {
    try {
      Response response = await dioClient.post(
        AppConstants.LOGIN_URI,
        data: loginBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveUserToken(String token) async {
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

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  Future<void> saveUserName(String userName) {
    return sharedPreferences.setString(AppConstants.USER_NAME, userName);
  }

  String getUserName() {
    return sharedPreferences.getString(AppConstants.USER_NAME) ?? "";
  }

  Future<void> saveUserId(String userId) {
    return sharedPreferences.setString(AppConstants.USER_ID.toString(), userId);
  }

  String getUserId() {
    return sharedPreferences.getString(AppConstants.USER_ID.toString()) ?? "";
  }

  Future<void> saveUserType(String userType) {
    return sharedPreferences.setString(AppConstants.USER_TYPE, userType);
  }

  String getUserType() {
    return sharedPreferences.getString(AppConstants.USER_TYPE)?? "";
  }

  Future<bool> clearAllData() async {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.USER_ID);
    // sharedPreferences.remove(AppConstants.IS_BUYER);
    return true;
  }
}
