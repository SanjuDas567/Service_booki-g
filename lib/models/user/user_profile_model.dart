// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  int success;
  List<Message> message;

  UserProfileModel({
    required this.success,
    required this.message,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    success: json["success"],
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  int id;
  String customerName;
  String email;
  String phone;
  String userProfilePic;

  Message({
    required this.id,
    required this.customerName,
    required this.email,
    required this.phone,
    required this.userProfilePic,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    customerName: json["customer_Name"],
    email: json["email"],
    phone: json["phone"],
    userProfilePic: json["user_profile_pic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_Name": customerName,
    "email": email,
    "phone": phone,
    "user_profile_pic": userProfilePic,
  };
}
