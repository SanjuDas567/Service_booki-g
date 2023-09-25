// To parse this JSON data, do
//
//     final houseKeepingTypeModel = houseKeepingTypeModelFromJson(jsonString);

import 'dart:convert';

HouseKeepingTypeModel houseKeepingTypeModelFromJson(String str) => HouseKeepingTypeModel.fromJson(json.decode(str));

String houseKeepingTypeModelToJson(HouseKeepingTypeModel data) => json.encode(data.toJson());

class HouseKeepingTypeModel {
    int success;
    List<HouseKeepingData> data;

    HouseKeepingTypeModel({
        required this.success,
        required this.data,
    });

    factory HouseKeepingTypeModel.fromJson(Map<String, dynamic> json) => HouseKeepingTypeModel(
        success: json["success"],
        data: List<HouseKeepingData>.from(json["data"].map((x) => HouseKeepingData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class HouseKeepingData {
    int nameSlno;
    String serviceName;
    int servicePrice;

    HouseKeepingData({
        required this.nameSlno,
        required this.serviceName,
        required this.servicePrice,
    });

    factory HouseKeepingData.fromJson(Map<String, dynamic> json) => HouseKeepingData(
        nameSlno: json["name_slno"],
        serviceName: json["service_name"],
        servicePrice: json["service_price"],
    );

    Map<String, dynamic> toJson() => {
        "name_slno": nameSlno,
        "service_name": serviceName,
        "service_price": servicePrice,
    };
}
