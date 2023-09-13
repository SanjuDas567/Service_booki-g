import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/form_data/commercial_booking_response.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class CommercialRepo {
  final DioClient dioClient;

  CommercialRepo({required this.dioClient});

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
      CommercialBookingModel commercialBookingModel) async {

    List multipartGutterImages = [];
     for (var i = 0; i < commercialBookingModel.servImageGutter!.length; i++) {
      multipartGutterImages
          .add(MultipartFile.fromFileSync(commercialBookingModel.servImageGutter![i].path));
    }
    List multipartSofaImage = [];
    for(var i = 0; i < commercialBookingModel.servImageSofa!.length; i++) {
      multipartSofaImage.add(MultipartFile.fromFileSync(commercialBookingModel.servImageSofa![i].path));
    }
    List multipartStainImage = [];
    for(var i = 0; i < commercialBookingModel.servImageStain!.length; i++) {
      multipartStainImage.add(MultipartFile.fromFileSync(commercialBookingModel.servImageStain![i].path));
    }
    List multipartCarpetImage = [];
    for(var i = 0; i < commercialBookingModel.servImageCarpet!.length; i++) {
      multipartCarpetImage.add(MultipartFile.fromFileSync(commercialBookingModel.servImageCarpet![i].path));
    }
    List multipartWindowImage = [];
    for(var i = 0; i < commercialBookingModel.servImageWindow!.length; i++) {
      multipartWindowImage.add(MultipartFile.fromFileSync(commercialBookingModel.servImageWindow![i].path));
    }
    List multipartDrivewayImage = [];
    for(var i = 0; i < commercialBookingModel.servImageDriveway!.length; i++) {
      multipartDrivewayImage.add(MultipartFile.fromFileSync(commercialBookingModel.servImageDriveway![i].path));
    }
    print("*/*/*/*/*/*/**/*/*/*/");
    print('user id : ${commercialBookingModel.userId}');
    print('user sl  no : ${commercialBookingModel.serNameSlno}');
    print('user type slno : ${commercialBookingModel.servTypeSlno}');
    print('ser time : ${commercialBookingModel.servTime}');
    print('ser date : ${commercialBookingModel.servDate}');
    print('ser location : ${commercialBookingModel.servLocation}');
    print('vehicle id : ${commercialBookingModel.vehicleId}');
    print('vehicle name : ${commercialBookingModel.vehicleName}');
    print('stain : ${commercialBookingModel.servImageStain}');
    print('sofa : ${commercialBookingModel.servImageSofa}');
    print('Carpet: ${commercialBookingModel.servImageCarpet}');
    print('Window : ${commercialBookingModel.servImageWindow}');
    print('gutter : ${commercialBookingModel.servImageGutter}');
    print('drive way : ${commercialBookingModel.servImageDriveway}');
    print("*/*/*/*/*/*/**/*/*/*/");
    var formdata = FormData.fromMap({
      "user_id": commercialBookingModel.userId,
      "ser_name_slno": commercialBookingModel.serNameSlno!.join(',').toString(),
      "serv_type_slno": commercialBookingModel.servTypeSlno,
      "serv_time": commercialBookingModel.servTime,
      "serv_date": commercialBookingModel.servDate,
      "serv_location": commercialBookingModel.servLocation,
      "vehicle_id" : commercialBookingModel.vehicleId,
      "vehicle_name" : commercialBookingModel.vehicleName,
      "serv_image_stain": multipartStainImage,
      "serv_image_sofa": multipartSofaImage,
      "serv_image_carpet": multipartCarpetImage,
      "serv_image_window": multipartWindowImage,
      "serv_image_gutter": multipartGutterImages,
      "serv_image_driveway": multipartDrivewayImage,
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
