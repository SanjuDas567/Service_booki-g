class LoginModelWorker {
  String? email;
  String? password;
  LoginModelWorker({
    this.email,
    this.password,
  });

  LoginModelWorker.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['user_pasword'] = password;
    return data;
  }
}