import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      HouseKeepBookingModel houseKeepBookingModel, BuildContext context) async {
    // final houseKeepingProvider =
    //     Provider.of<HouseKeepingProvider>(context, listen: false);
    List multipartGutterImages = [];
     for (var i = 0; i < houseKeepBookingModel.servImageGutter!.length; i++) {
      multipartGutterImages
          .add(MultipartFile.fromFileSync(houseKeepBookingModel.servImageGutter![i].path));
    }
    List multipartSofaImage = [];
    for(var i = 0; i < houseKeepBookingModel.servImageSofa!.length; i++) {
      multipartSofaImage.add(MultipartFile.fromFileSync(houseKeepBookingModel.servImageSofa![i].path));
    }
    List multipartStainImage = [];
    for(var i = 0; i < houseKeepBookingModel.servImageStain!.length; i++) {
      multipartStainImage.add(MultipartFile.fromFileSync(houseKeepBookingModel.servImageStain![i].path));
    }
    List multipartCarpetImage = [];
    for(var i = 0; i < houseKeepBookingModel.servImageCarpet!.length; i++) {
      multipartCarpetImage.add(MultipartFile.fromFileSync(houseKeepBookingModel.servImageCarpet![i].path));
    }
    List multipartWindowImage = [];
    for(var i = 0; i < houseKeepBookingModel.servImageWindow!.length; i++) {
      multipartWindowImage.add(MultipartFile.fromFileSync(houseKeepBookingModel.servImageWindow![i].path));
    }
    List multipartDrivewayImage = [];
    for(var i = 0; i < houseKeepBookingModel.servImageDriveway!.length; i++) {
      multipartDrivewayImage.add(MultipartFile.fromFileSync(houseKeepBookingModel.servImageDriveway![i].path));
    }
    print("*/*/*/*/*/*/**/*/*/*/");
    print('user id : ${houseKeepBookingModel.userId}');
    print('user sl  no : ${houseKeepBookingModel.serNameSlno}');
    print('user type slno : ${houseKeepBookingModel.servTypeSlno}');
    print('ser time : ${houseKeepBookingModel.servTime}');
    print('ser date : ${houseKeepBookingModel.servDate}');
    print('ser location : ${houseKeepBookingModel.servLocation}');
    print('vehicle id : ${houseKeepBookingModel.vehicleId}');
    print('vehicle name : ${houseKeepBookingModel.vehicleName}');
    print('stain : ${houseKeepBookingModel.servImageStain}');
    print('sofa : ${houseKeepBookingModel.servImageSofa}');
    print('Carpet: ${houseKeepBookingModel.servImageCarpet}');
    print('Window : ${houseKeepBookingModel.servImageWindow}');
    print('gutter : ${multipartGutterImages[0]}');
    print('drive way : ${houseKeepBookingModel.servImageDriveway}');
    print("*/*/*/*/*/*/**/*/*/*/");
    var formdata = FormData.fromMap({
      "user_id": houseKeepBookingModel.userId,
      "ser_name_slno": houseKeepBookingModel.serNameSlno,
      "serv_type_slno": houseKeepBookingModel.servTypeSlno,
      "serv_time": houseKeepBookingModel.servTime,
      "serv_date": houseKeepBookingModel.servDate,
      "serv_location": houseKeepBookingModel.servLocation,
      "vehicle_id" : houseKeepBookingModel.vehicleId,
      "vehicle_name" : houseKeepBookingModel.vehicleName,
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
