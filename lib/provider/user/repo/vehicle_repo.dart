// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';


class VehicleRepo {
  DioClient dioClient;
  VehicleRepo({
    required this.dioClient,
  });

   Future<ApiResponse> getServiceName(String serviceId) async {
    try {
      Response response = await dioClient.get(
        AppConstants.SERVICE_NAME_URI + serviceId,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}