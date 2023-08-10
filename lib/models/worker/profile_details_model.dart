// To parse this JSON data, do
//
//     final workerProfileModel = workerProfileModelFromJson(jsonString);

import 'dart:convert';

WorkerProfileModel workerProfileModelFromJson(String str) => WorkerProfileModel.fromJson(json.decode(str));

String workerProfileModelToJson(WorkerProfileModel data) => json.encode(data.toJson());

class WorkerProfileModel {
  int success;
  Data data;

  WorkerProfileModel({
    required this.success,
    required this.data,
  });

  factory WorkerProfileModel.fromJson(Map<String, dynamic> json) => WorkerProfileModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  List<WorkerCard> card;
  List<Screen> screen;

  Data({
    required this.card,
    required this.screen,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    card: List<WorkerCard>.from(json["card"].map((x) => WorkerCard.fromJson(x))),
    screen: List<Screen>.from(json["screen"].map((x) => Screen.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "card": List<dynamic>.from(card.map((x) => x.toJson())),
    "screen": List<dynamic>.from(screen.map((x) => x.toJson())),
  };
}

class WorkerCard {
  String empName;
  String isuenceId;
  String experience;
  String workAvlFrom;
  String workAvlTo;

  WorkerCard({
    required this.empName,
    required this.isuenceId,
    required this.experience,
    required this.workAvlFrom,
    required this.workAvlTo,
  });

  factory WorkerCard.fromJson(Map<String, dynamic> json) => WorkerCard(
    empName: json["emp_name"],
    isuenceId: json["isuence_id"],
    experience: json["experience"],
    workAvlFrom: json["WorkAvl_from"],
    workAvlTo: json["work_avl_to"],
  );

  Map<String, dynamic> toJson() => {
    "emp_name": empName,
    "isuence_id": isuenceId,
    "experience": experience,
    "WorkAvl_from": workAvlFrom,
    "work_avl_to": workAvlTo,
  };
}

class Screen {
  String empAddress;
  String empLocation;
  String empProfilePic;
  String empEmail;
  String triningCourse;
  String empPhone;

  Screen({
    required this.empAddress,
    required this.empLocation,
    required this.empProfilePic,
    required this.empEmail,
    required this.triningCourse,
    required this.empPhone,
  });

  factory Screen.fromJson(Map<String, dynamic> json) => Screen(
    empAddress: json["emp_address"],
    empLocation: json["emp_location"],
    empProfilePic: json["emp_profile_pic"],
    empEmail: json["emp_email"],
    triningCourse: json["trining_course"],
    empPhone: json["emp_phone"],
  );

  Map<String, dynamic> toJson() => {
    "emp_address": empAddress,
    "emp_location": empLocation,
    "emp_profile_pic": empProfilePic,
    "emp_email": empEmail,
    "trining_course": triningCourse,
    "emp_phone": empPhone,
  };
}
