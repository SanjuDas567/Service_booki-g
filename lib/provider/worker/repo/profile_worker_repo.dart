import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
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
}