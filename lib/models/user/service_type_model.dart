// To parse this JSON data, do
//
//     final serviceTypeModel = serviceTypeModelFromJson(jsonString);

import 'dart:convert';

ServiceTypeModel serviceTypeModelFromJson(String str) => ServiceTypeModel.fromJson(json.decode(str));

String serviceTypeModelToJson(ServiceTypeModel data) => json.encode(data.toJson());

class ServiceTypeModel {
    int success;
    List<Datum> data;

    ServiceTypeModel({
        required this.success,
        required this.data,
    });

    factory ServiceTypeModel.fromJson(Map<String, dynamic> json) => ServiceTypeModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int typeSlno;
    String serviceType;

    Datum({
        required this.typeSlno,
        required this.serviceType,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        typeSlno: json["type_slno"],
        serviceType: json["service_type"],
    );

    Map<String, dynamic> toJson() => {
        "type_slno": typeSlno,
        "service_type": serviceType,
    };
}
