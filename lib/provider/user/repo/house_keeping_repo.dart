import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/form_data/house_keeping_booking_response.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class HouseKeepingRepo {
  final DioClient dioClient;
  const HouseKeepingRepo({required this.dioClient});

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

  Future<ApiResponse> houseKeepBooking(
      HouseKeepBookingModel houseKeepBookingModel) async {
    try {
      Response response = await dioClient.post(
        AppConstants.HOME_SERVICE_BOOKING_URI,
        data: houseKeepBookingModel.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
