class HouseKeepBookingModel {
  String? userId;
  int? serNameSlno;
  String? servTypeSlno;
  List<String>? servImage;
  String? servTime;
  String? servDate;
  String? servLocation;
  String? vehicleId;
  String? vehicleName;

  HouseKeepBookingModel(
      {this.userId,
      this.serNameSlno,
      this.servTypeSlno,
      this.servImage,
      this.servTime,
      this.servDate,
      this.servLocation,
      this.vehicleId,
      this.vehicleName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['ser_name_slno'] = serNameSlno;
    data['serv_type_slno'] = servTypeSlno;
    data['serv_image'] = servImage;
    data['serv_time'] = servTime;
    data['serv_date'] = servDate;
    data['serv_location'] = servLocation;
    data['vehicle_id'] = vehicleId;
    data['vehicle_name'] = vehicleName;
    return data;
  }
}

// class HouseKeepBookingModel {
//   String? userId;
//   List<int>? serNameSlno;
//   String? servTypeSlno;
//   List<String>? servImage;
//   String? servTime;
//   String? servDate;
//   String? servLocation;
//   String? vehicleId;
//   String? vehicleName;

//   HouseKeepBookingModel({
//     this.userId,
//     this.serNameSlno,
//     this.servTypeSlno,
//     this.servImage,
//     this.servTime,
//     this.servDate,
//     this.servLocation,
//     this.vehicleId,
//     this.vehicleName,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = userId;
//     data['ser_name_slno'] = serNameSlno;
//     data['serv_type_slno'] = servTypeSlno;
//     data['serv_image'] = servImage;
//     data['serv_time'] = servTime;
//     data['serv_date'] = servDate;
//     data['serv_location'] = servLocation;
//     data['vehicle_id'] = vehicleId;
//     data['vehicle_name'] = vehicleName;
//     return data;
//   }
// }