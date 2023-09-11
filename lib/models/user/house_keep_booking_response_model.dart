// To parse this JSON data, do
//
//     final houseKeepResponse = houseKeepResponseFromJson(jsonString);

import 'dart:convert';

HouseKeepResponse houseKeepResponseFromJson(String str) => HouseKeepResponse.fromJson(json.decode(str));

String houseKeepResponseToJson(HouseKeepResponse data) => json.encode(data.toJson());

class HouseKeepResponse {
    int success;
    String message;

    HouseKeepResponse({
        required this.success,
        required this.message,
    });

    factory HouseKeepResponse.fromJson(Map<String, dynamic> json) => HouseKeepResponse(
        success: json["success"],
        message: json["results"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "results": message,
    };
}
