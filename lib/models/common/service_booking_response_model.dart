// To parse this JSON data, do
//
//     final houseKeepResponse = houseKeepResponseFromJson(jsonString);

import 'dart:convert';

ServiceBookingResponse houseKeepResponseFromJson(String str) => ServiceBookingResponse.fromJson(json.decode(str));

String houseKeepResponseToJson(ServiceBookingResponse data) => json.encode(data.toJson());

class ServiceBookingResponse {
    int success;
    String message;

    ServiceBookingResponse({
        required this.success,
        required this.message,
    });

    factory ServiceBookingResponse.fromJson(Map<String, dynamic> json) => ServiceBookingResponse(
        success: json["success"],
        message: json["results"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "results": message,
    };
}
