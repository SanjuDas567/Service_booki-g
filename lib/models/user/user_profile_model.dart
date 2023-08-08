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
    String userFname;
    String userLname;
    String email;
    String phone;
    String address;
    String userPasword;
    String userProfilePic;

    Message({
        required this.id,
        required this.customerName,
        required this.userFname,
        required this.userLname,
        required this.email,
        required this.phone,
        required this.address,
        required this.userPasword,
        required this.userProfilePic,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        customerName: json["customer_Name"],
        userFname: json["user_fname"],
        userLname: json["user_lname"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        userPasword: json["user_pasword"],
        userProfilePic: json["user_profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_Name": customerName,
        "user_fname": userFname,
        "user_lname": userLname,
        "email": email,
        "phone": phone,
        "address": address,
        "user_pasword": userPasword,
        "user_profile_pic": userProfilePic,
    };
}
