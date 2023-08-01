import 'dart:io';

import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/form_data/user_data.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class RegisterRepo {
  final DioClient dioClient;

  RegisterRepo({required this.dioClient});
  Future<ApiResponse> registerUser(
      UserRegistration userRegistration, File imagefile) async {
    var formData = FormData.fromMap({
      "user_fname": userRegistration.userFname,
      "user_lname": userRegistration.userLname,
      "phone": userRegistration.phone,
      "address": userRegistration.address,
      "email": userRegistration.email,
      "user_pasword": userRegistration.userPasword,
      "user_profile_pic": await MultipartFile.fromFile(imagefile.path,
          filename: imagefile.path.split('/').last),
      "app_user": userRegistration.appUser,
    });
    try {
      print('inside try');
      final response = await dioClient.post(
        AppConstants.REGISTER_URL,
        options: Options(responseType: ResponseType.plain),
        data: formData,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(e),
      );
    }
  }
}
