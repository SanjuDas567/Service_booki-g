import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class UserProfileRepo{
  final DioClient dioClient;

  UserProfileRepo(this.dioClient);
  Future<ApiResponse> getUserProfileData(int uId) async {
   try {
     Response response = await dioClient.get(AppConstants.USER_PROFILE_DATA + uId.toString());
     return ApiResponse.withSuccess(response);
   } catch (e) {
     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
   }
  }
}