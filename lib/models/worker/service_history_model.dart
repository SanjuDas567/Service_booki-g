// To parse this JSON data, do
//
//     final workerHistory = workerHistoryFromJson(jsonString);

import 'dart:convert';

WorkerHistory workerHistoryFromJson(String str) =>
    WorkerHistory.fromJson(json.decode(str));

String workerHistoryToJson(WorkerHistory data) => json.encode(data.toJson());

class WorkerHistory {
  int success;
  List<Message>? message;

  WorkerHistory({
    required this.success,
    this.message,
  });

  factory WorkerHistory.fromJson(Map<String, dynamic> json) => WorkerHistory(
        success: json["success"],
        message: json["message"] != null
            ? List<Message>.from(
                json["message"].map((x) => Message.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message != null
            ? List<dynamic>.from(message!.map((x) => x.toJson()))
            : null,
      };
}

class Message {
  int empId;
  int serviceTypeSlno;
  String empFirstname;
  int serviceNameSlno;
  String serviceType;
  String serviceName;
  String workImageAfter;
  String workImageBefore;

  Message({
    required this.empId,
    required this.serviceTypeSlno,
    required this.empFirstname,
    required this.serviceNameSlno,
    required this.serviceType,
    required this.serviceName,
    required this.workImageAfter,
    required this.workImageBefore,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        empId: json["emp_id"],
        serviceTypeSlno: json["service_type_slno"],
        empFirstname: json["emp_firstname"],
        serviceNameSlno: json["service_name_slno"],
        serviceType: json["service_type"],
        serviceName: json["service_name"],
        workImageAfter: json["work_image_after"],
        workImageBefore: json["work_image_before"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "service_type_slno": serviceTypeSlno,
        "emp_firstname": empFirstname,
        "service_name_slno": serviceNameSlno,
        "service_type": serviceType,
        "service_name": serviceName,
        "work_image_after": workImageAfter,
        "work_image_before": workImageBefore,
      };
}
