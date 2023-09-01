import 'dart:io';

import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/worker/form_data/edit_profile_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class ProfileWorkerRepo {
  final DioClient dioClient;
  ProfileWorkerRepo({required this.dioClient});
  Future<ApiResponse> getWorkerDetail(String workerId) async {
    try{
      final response = await dioClient.get(AppConstants.WORKER_PROFILE_DETAILS_URI + workerId.toString());
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> updateProfileData(
      UpdateProfileData updateProfileData, File imageFile) async {
    var data = FormData.fromMap({
      'emp_profile_pic' : await MultipartFile.fromFile(imageFile.path,
      filename: imageFile.path),
      'emp_firstname': updateProfileData.empFirstname,
      'emp_lastname': updateProfileData.empLastname,
      'emp_phone' : updateProfileData.empPhone,
      'emp_address' : updateProfileData.empAddress,
      'emp_location' : updateProfileData.empLocation,
      'WorkAvl_from' : updateProfileData.workAvlFrom,
      'work_avl_to' : updateProfileData.workAvlTo,
      'experience' : updateProfileData.experience,
      'isuence_id' : updateProfileData.insuranceId,
      'trining_course' : updateProfileData.triningCourse,
      'emp_email' : updateProfileData.empEmail,
      'emp_id' : updateProfileData.iD,
    });
    try{
      Response response = await dioClient.patch(AppConstants.WORKER_PROFILE_UPDATION_URI,
      data: data);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}