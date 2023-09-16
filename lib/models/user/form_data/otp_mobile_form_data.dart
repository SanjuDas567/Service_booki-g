class OtpPhoneNum {
  String? phoneNumber;

  OtpPhoneNum({this.phoneNumber});

  OtpPhoneNum.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class OtpVerify {
  String? phoneNumber;
  String? otp;

  OtpVerify({this.phoneNumber, this.otp});

  OtpVerify.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['otp'] = this.otp;
    return data;
  }
}