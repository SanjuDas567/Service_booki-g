// To parse this JSON data, do
//
//     final loginApiResponseModel = loginApiResponseModelFromJson(jsonString);

import 'dart:convert';

LoginApiResponseModel loginApiResponseModelFromJson(String str) => LoginApiResponseModel.fromJson(json.decode(str));

String loginApiResponseModelToJson(LoginApiResponseModel data) => json.encode(data.toJson());

class LoginApiResponseModel {
    int success;
    List<Message> message;
    String token;

    LoginApiResponseModel({
        required this.success,
        required this.message,
        required this.token,
    });

    factory LoginApiResponseModel.fromJson(Map<String, dynamic> json) => LoginApiResponseModel(
        success: json["success"],
        message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
        "token": token,
    };
}

class Message {
    String userFname;
    int id;
    dynamic appUser;

    Message({
        required this.userFname,
        required this.id,
        this.appUser,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        userFname: json["user_fname"],
        id: json["id"],
        appUser: json["app_user"],
    );

    Map<String, dynamic> toJson() => {
        "user_fname": userFname,
        "id": id,
        "app_user": appUser,
    };
}
