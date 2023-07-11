// To parse this JSON data, do
//
//     final userRegisterResponse = userRegisterResponseFromJson(jsonString);

import 'dart:convert';

UserRegisterResponseModel userRegisterResponseFromJson(String str) =>
    UserRegisterResponseModel.fromJson(json.decode(str));

String userRegisterResponseToJson(UserRegisterResponseModel data) =>
    json.encode(data.toJson());

class UserRegisterResponseModel {
  int success;
  String message;

  UserRegisterResponseModel({
    required this.success,
    required this.message,
  });

  factory UserRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
