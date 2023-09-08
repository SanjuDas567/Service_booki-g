// To parse this JSON data, do
//
//     final adminLoginModel = adminLoginModelFromJson(jsonString);

import 'dart:convert';

AdminLoginModel adminLoginModelFromJson(String str) => AdminLoginModel.fromJson(json.decode(str));

String adminLoginModelToJson(AdminLoginModel data) => json.encode(data.toJson());

class AdminLoginModel {
  int success;
  List<AdminMessage> message;
  String token;

  AdminLoginModel({
    required this.success,
    required this.message,
    required this.token,
  });

  factory AdminLoginModel.fromJson(Map<String, dynamic> json) => AdminLoginModel(
    success: json["success"],
    message: List<AdminMessage>.from(json["message"].map((x) => AdminMessage.fromJson(x))),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "token": token,
  };
}

class AdminMessage {
  String adminName;
  int adSlno;
  int appUser;

  AdminMessage({
    required this.adminName,
    required this.adSlno,
    required this.appUser,
  });

  factory AdminMessage.fromJson(Map<String, dynamic> json) => AdminMessage(
    adminName: json["admin_name"],
    adSlno: json["ad_slno"],
    appUser: json["app_user"],
  );

  Map<String, dynamic> toJson() => {
    "admin_name": adminName,
    "ad_slno": adSlno,
    "app_user": appUser,
  };
}
