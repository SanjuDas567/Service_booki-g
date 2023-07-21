// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_login_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class AuthWorkerRepo {
  final DioClient dioClient;
  AuthWorkerRepo({
    required this.dioClient,
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
}
