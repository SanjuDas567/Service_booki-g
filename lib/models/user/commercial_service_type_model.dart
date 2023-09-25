// To parse this JSON data, do
//
//     final commercialServiceTypeModel = commercialServiceTypeModelFromJson(jsonString);

import 'dart:convert';

CommercialServiceTypeModel commercialServiceTypeModelFromJson(String str) => CommercialServiceTypeModel.fromJson(json.decode(str));

String commercialServiceTypeModelToJson(CommercialServiceTypeModel data) => json.encode(data.toJson());

class CommercialServiceTypeModel {
    int success;
    List<CommercialServiceTypeData> data;

    CommercialServiceTypeModel({
        required this.success,
        required this.data,
    });

    factory CommercialServiceTypeModel.fromJson(Map<String, dynamic> json) => CommercialServiceTypeModel(
        success: json["success"],
        data: List<CommercialServiceTypeData>.from(json["data"].map((x) => CommercialServiceTypeData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CommercialServiceTypeData {
    int nameSlno;
    String serviceName;
    int servicePrice;

    CommercialServiceTypeData({
        required this.nameSlno,
        required this.serviceName,
        required this.servicePrice,
    });

    factory CommercialServiceTypeData.fromJson(Map<String, dynamic> json) => CommercialServiceTypeData(
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

