// To parse this JSON data, do
//
//     final commercialServiceTypeModel = commercialServiceTypeModelFromJson(jsonString);

import 'dart:convert';

ServiceTypeModel commercialServiceTypeModelFromJson(String str) =>
    ServiceTypeModel.fromJson(json.decode(str));

String commercialServiceTypeModelToJson(ServiceTypeModel data) =>
    json.encode(data.toJson());

class ServiceTypeModel {
  int success;
  List<ServiceTypeData> data;

  ServiceTypeModel({
    required this.success,
    required this.data,
  });

  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) =>
      ServiceTypeModel(
        success: json["success"],
        data: List<ServiceTypeData>.from(
            json["data"].map((x) => ServiceTypeData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ServiceTypeData {
  int nameSlno;
  String serviceName;

  ServiceTypeData({
    required this.nameSlno,
    required this.serviceName,
  });

  factory ServiceTypeData.fromJson(Map<String, dynamic> json) => ServiceTypeData(
        nameSlno: json["name_slno"],
        serviceName: json["service_name"],
      );

  Map<String, dynamic> toJson() => {
        "name_slno": nameSlno,
        "service_name": serviceName,
      };
}
