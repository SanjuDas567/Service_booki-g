class UserRegistrationModel {
  String? userFname;
  String? userLname;
  String? phone;
  String? address;
  String? email;
  String? userPasword;
  Null userProfilePic;
  int? appUser;

  UserRegistrationModel(
      {this.userFname,
      this.userLname,
      this.phone,
      this.address,
      this.email,
      this.userPasword,
      this.userProfilePic,
      this.appUser});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_fname'] = userFname;
    data['user_lname'] = userLname;
    data['phone'] = phone;
    data['address'] = address;
    data['email'] = email;
    data['user_pasword'] = userPasword;
    data['user_profile_pic'] = userProfilePic;
    data['app_user'] = appUser;
    return data;
  }
}


// class UserRegistrationModel {
//   String? userFname;
//   String? userLname;
//   String? phone;
//   String? address;
//   String? email;
//   String? userPassword;

//   UserRegistrationModel({
//     this.userFname,
//     this.userLname,
//     this.phone,
//     this.address,
//     this.email,
//     this.userPassword,
//   });

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_fname'] = userFname;
//     data['user_lname'] = userLname;
//     data['phone'] = phone;
//     data['address'] = address;
//     data['email'] = email;
//     data['user_pasword'] = userPassword;
//     return data;
//   }
// }
