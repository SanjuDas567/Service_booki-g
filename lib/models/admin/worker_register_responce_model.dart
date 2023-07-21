// To parse this JSON data, do
//
//     final workerRegisterResponseModel = workerRegisterResponseModelFromJson(jsonString);

import 'dart:convert';

WorkerRegisterResponseModel workerRegisterResponseModelFromJson(String str) => WorkerRegisterResponseModel.fromJson(json.decode(str));

String workerRegisterResponseModelToJson(WorkerRegisterResponseModel data) => json.encode(data.toJson());

class WorkerRegisterResponseModel {
    int success;
    String message;

    WorkerRegisterResponseModel({
        required this.success,
        required this.message,
    });

    factory WorkerRegisterResponseModel.fromJson(Map<String, dynamic> json) => WorkerRegisterResponseModel(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
