// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/form_data/vehicle_service_booking.dart';
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

  Future<ApiResponse> vehicleServiceBooking(
    VehicleServiceBookingModel vehicleServiceBookingModel) async {
      print("*/*/*/*/*/*/**/*/*/*/");
    print('user id : ${vehicleServiceBookingModel.userId}');
    print('user sl  no : ${vehicleServiceBookingModel.serNameSlno}');
    print('user type slno : ${vehicleServiceBookingModel.servTypeSlno}');
    print('ser time : ${vehicleServiceBookingModel.servTime}');
    print('ser date : ${vehicleServiceBookingModel.servDate}');
    print('ser location : ${vehicleServiceBookingModel.servLocation}');
    print('vehicle id : ${vehicleServiceBookingModel.vehicleId}');
    print('vehicle name : ${vehicleServiceBookingModel.vehicleName}');
    print('stain : ${vehicleServiceBookingModel.servImageStain}');
    print('sofa : ${vehicleServiceBookingModel.servImageSofa}');
    print('Carpet: ${vehicleServiceBookingModel.servImageCarpet}');
    print('Window : ${vehicleServiceBookingModel.servImageWindow}');
    print('gutter : ${vehicleServiceBookingModel.servImageGutter}');
    print('drive way : ${vehicleServiceBookingModel.servImageDriveway}');
    print("*/*/*/*/*/*/**/*/*/*/");
      var formdata = FormData.fromMap({
        "user_id": vehicleServiceBookingModel.userId,
      "ser_name_slno": vehicleServiceBookingModel.serNameSlno.toString(),
      "serv_type_slno": vehicleServiceBookingModel.servTypeSlno,
      "serv_time": vehicleServiceBookingModel.servTime,
      "serv_date": vehicleServiceBookingModel.servDate,
      "serv_location": vehicleServiceBookingModel.servLocation,
      "vehicle_id" : vehicleServiceBookingModel.vehicleId,
      "vehicle_name" : vehicleServiceBookingModel.vehicleName,
      "serv_image_stain": vehicleServiceBookingModel.servImageStain,
      "serv_image_sofa": vehicleServiceBookingModel.servImageSofa,
      "serv_image_carpet": vehicleServiceBookingModel.servImageCarpet,
      "serv_image_window": vehicleServiceBookingModel.servImageWindow,
      "serv_image_gutter": vehicleServiceBookingModel.servImageGutter,
      "serv_image_driveway": vehicleServiceBookingModel.servImageDriveway,
      });
    try {
      Response response = await dioClient.post(
        AppConstants.SERVICE_BOOKING_URI,
        data: formdata,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
