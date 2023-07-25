// To parse this JSON data, do
//
//     final workerLoginApiResponse203Model = workerLoginApiResponse203ModelFromJson(jsonString);

import 'dart:convert';

WorkerLoginApiResponse203Model workerLoginApiResponse203ModelFromJson(
        String str) =>
    WorkerLoginApiResponse203Model.fromJson(json.decode(str));

String workerLoginApiResponse203ModelToJson(
        WorkerLoginApiResponse203Model data) =>
    json.encode(data.toJson());

class WorkerLoginApiResponse203Model {
  int success;
  String message;

  WorkerLoginApiResponse203Model({
    required this.success,
    required this.message,
  });

  factory WorkerLoginApiResponse203Model.fromJson(Map<String, dynamic> json) =>
      WorkerLoginApiResponse203Model(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
