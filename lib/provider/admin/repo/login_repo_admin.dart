import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/admin/login_model_admin.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepoAdmin {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  LoginRepoAdmin({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login(LoginModelAdmin loginModelAdmin) async {
    try{
      Response response = await dioClient.post(
        AppConstants.ADMIN_LOGIN_URI,
        data: loginModelAdmin.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}