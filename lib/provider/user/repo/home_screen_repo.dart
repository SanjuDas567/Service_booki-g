import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class HomeScreenRepo {
  final DioClient dioClient;

  HomeScreenRepo({required this.dioClient});

  Future<ApiResponse> getServiceType() async {
    try {
      Response response = await dioClient.get(AppConstants.SERVICE_TYPE_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
