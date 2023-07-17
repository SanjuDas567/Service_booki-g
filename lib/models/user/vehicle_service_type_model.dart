// To parse this JSON data, do
//
//     final vehicleServiceTypeModel = vehicleServiceTypeModelFromJson(jsonString);

import 'dart:convert';

VehicleServiceTypeModel vehicleServiceTypeModelFromJson(String str) => VehicleServiceTypeModel.fromJson(json.decode(str));

String vehicleServiceTypeModelToJson(VehicleServiceTypeModel data) => json.encode(data.toJson());

class VehicleServiceTypeModel {
    int success;
    List<VehicleServiceTypeData> data;

    VehicleServiceTypeModel({
        required this.success,
        required this.data,
    });

    factory VehicleServiceTypeModel.fromJson(Map<String, dynamic> json) => VehicleServiceTypeModel(
        success: json["success"],
        data: List<VehicleServiceTypeData>.from(json["data"].map((x) => VehicleServiceTypeData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class VehicleServiceTypeData {
    int nameSlno;
    String serviceName;

    VehicleServiceTypeData({
        required this.nameSlno,
        required this.serviceName,
    });

    factory VehicleServiceTypeData.fromJson(Map<String, dynamic> json) => VehicleServiceTypeData(
        nameSlno: json["name_slno"],
        serviceName: json["service_name"],
    );

    Map<String, dynamic> toJson() => {
        "name_slno": nameSlno,
        "service_name": serviceName,
    };
}
