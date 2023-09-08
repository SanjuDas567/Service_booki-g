class LoginModelAdmin {
  String? email;
  String? password;
  LoginModelAdmin({
    this.email,
    this.password,
  });

  LoginModelAdmin.fromJson(Map<String, dynamic> json) {
    email = json['admin_email'];
    password = json['admin_password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admin_email'] = email;
    data['admin_password'] = password;
    return data;
  }
}
