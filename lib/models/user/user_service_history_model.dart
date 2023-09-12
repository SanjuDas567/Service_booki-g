// To parse this JSON data, do
//
//     final serviceHistoryModel = serviceHistoryModelFromJson(jsonString);

import 'dart:convert';

ServiceHistoryModel serviceHistoryModelFromJson(String str) => ServiceHistoryModel.fromJson(json.decode(str));

String serviceHistoryModelToJson(ServiceHistoryModel data) => json.encode(data.toJson());

class ServiceHistoryModel {
    int success;
    List<ServiceHistoryData>? data;

    ServiceHistoryModel({
        required this.success,
         this.data,
    });

    factory ServiceHistoryModel.fromJson(Map<String, dynamic> json) => ServiceHistoryModel(
        success: json["success"],
        data: json["data"] != null ? List<ServiceHistoryData>.from(json["data"].map((x) => ServiceHistoryData.fromJson(x)))
        : null,
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
    };
}

class ServiceHistoryData {
    int userId;
    String customerName;
    String serNameSlno;
    String? serviceName;
    int servTypeSlno;
    String serviceType;
    dynamic servImageStain;
    dynamic servImageSofa;
    dynamic servImageCarpet;
    dynamic servImageWindow;
    dynamic servImageGutter;
    dynamic servImageDriveway;
    String servTime;
    DateTime servDate;
    String servLocation;
    String vehicleName;
    String vehicleId;

    ServiceHistoryData({
        required this.userId,
        required this.customerName,
        required this.serNameSlno,
        required this.serviceName,
        required this.servTypeSlno,
        required this.serviceType,
        required this.servImageStain,
        required this.servImageSofa,
        required this.servImageCarpet,
        required this.servImageWindow,
        required this.servImageGutter,
        required this.servImageDriveway,
        required this.servTime,
        required this.servDate,
        required this.servLocation,
        required this.vehicleName,
        required this.vehicleId,
    });

    factory ServiceHistoryData.fromJson(Map<String, dynamic> json) => ServiceHistoryData(
         userId: json["user_id"],
        customerName: json["customer_Name"],
        serNameSlno: json["ser_name_slno"],
        serviceName: json["service_name"],
        servTypeSlno: json["serv_type_slno"],
        serviceType: json["service_type"],
        servImageStain: json["serv_image_stain"],
        servImageSofa: json["serv_image_sofa"],
        servImageCarpet: json["serv_image_carpet"],
        servImageWindow: json["serv_image_window"],
        servImageGutter: json["serv_image_gutter"],
        servImageDriveway: json["serv_image_driveway"],
        servTime: json["serv_time"],
        servDate: DateTime.parse(json["serv_date"]),
        servLocation: json["serv_location"],
        vehicleName: json["vehicle_name"],
        vehicleId: json["vehicle_id"],
    );

    Map<String, dynamic> toJson() => {
       "user_id": userId,
        "customer_Name": customerName,
        "ser_name_slno": serNameSlno,
        "service_name": serviceName,
        "serv_type_slno": servTypeSlno,
        "service_type": serviceType,
        "serv_image_stain": servImageStain,
        "serv_image_sofa": servImageSofa,
        "serv_image_carpet": servImageCarpet,
        "serv_image_window": servImageWindow,
        "serv_image_gutter": servImageGutter,
        "serv_image_driveway": servImageDriveway,
        "serv_time": servTime,
        "serv_date": servDate.toIso8601String(),
        "serv_location": servLocation,
        "vehicle_name": vehicleName,
        "vehicle_id": vehicleId,
    };
}
