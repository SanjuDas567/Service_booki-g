import 'dart:io';

import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/form_data/user_profile_update.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class UserProfileRepo {
  final DioClient dioClient;

  UserProfileRepo(this.dioClient);
  Future<ApiResponse> getUserProfileData(int uId) async {
    try {
      Response response =
          await dioClient.get(AppConstants.USER_PROFILE_DATA + uId.toString());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateUserDetails(
      UserUpdateModel userUpdateModel, File imagefile) async {
    var data = FormData.fromMap({
      'user_profile_pic': await MultipartFile.fromFile(imagefile.path,
          filename: imagefile.path),
      'user_fname': userUpdateModel.userFname,
      'user_lname': userUpdateModel.userLname,
      'phone': userUpdateModel.phone,
      'address': userUpdateModel.address,
      'email': userUpdateModel.email,
      'user_pasword': userUpdateModel.userPasword,
      'app_user': 1,
      'id': userUpdateModel.id,
    });
    print('*-*-*-*-*-*--*-*-*');
    print('fname : ${userUpdateModel.userFname}');
    print('Lname : ${userUpdateModel.userLname}');
    print('Email : ${userUpdateModel.email}');
    print('Phone : ${userUpdateModel.phone}');
    print('Address : ${userUpdateModel.address}');
    print('password : ${userUpdateModel.userPasword}');
    print('App user : ${userUpdateModel.appuser}');
    print('id : ${userUpdateModel.id}');
    print('image : ${imagefile.path}');
    print('*-*-*-*-*-*--*-*-*');
    try {
      Response response =
          await dioClient.patch(AppConstants.USER_EDIT_PROFILE_URI, data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
