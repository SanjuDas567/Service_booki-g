// To parse this JSON data, do
//
//     final UserLoginApiResponce203Model = UserLoginApiResponce203ModelFromJson(jsonString);

import 'dart:convert';

UserLoginApiResponce203Model UserLoginApiResponce203ModelFromJson(
        String str) =>
    UserLoginApiResponce203Model.fromJson(json.decode(str));

String UserLoginApiResponce203ModelToJson(
        UserLoginApiResponce203Model data) =>
    json.encode(data.toJson());

class UserLoginApiResponce203Model {
  int success;
  String message;

  UserLoginApiResponce203Model({
    required this.success,
    required this.message,
  });

  factory UserLoginApiResponce203Model.fromJson(Map<String, dynamic> json) =>
      UserLoginApiResponce203Model(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
