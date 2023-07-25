// To parse this JSON data, do
//
//     final workerLoginApiResponse200Model = workerLoginApiResponse200ModelFromJson(jsonString);

import 'dart:convert';

WorkerLoginApiResponse200Model workerLoginApiResponse200ModelFromJson(String str) => WorkerLoginApiResponse200Model.fromJson(json.decode(str));

String workerLoginApiResponse200ModelToJson(WorkerLoginApiResponse200Model data) => json.encode(data.toJson());

class WorkerLoginApiResponse200Model {
    int success;
    List<Message> message;
    String token;

    WorkerLoginApiResponse200Model({
        required this.success,
        required this.message,
        required this.token,
    });

    factory WorkerLoginApiResponse200Model.fromJson(Map<String, dynamic> json) => WorkerLoginApiResponse200Model(
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
    int empId;
    String empFirstname;
    String empLastname;
    int appUser;

    Message({
        required this.empId,
        required this.empFirstname,
        required this.empLastname,
        required this.appUser,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        empId: json["emp_id"],
        empFirstname: json["emp_firstname"],
        empLastname: json["emp_lastname"],
        appUser: json["app_user"],
    );

    Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "emp_firstname": empFirstname,
        "emp_lastname": empLastname,
        "app_user": appUser,
    };
}
