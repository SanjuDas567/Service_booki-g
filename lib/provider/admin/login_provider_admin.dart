import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/admin/admin_login_data_model.dart';
import 'package:glossy_flossy/models/admin/login_model_admin.dart';
import 'package:glossy_flossy/provider/admin/repo/login_repo_admin.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class LoginProviderAdmin extends ChangeNotifier {
  final LoginRepoAdmin loginRepoAdmin;
  LoginProviderAdmin({required this.loginRepoAdmin});

  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }

  // login method :-------------------------------------------------------------

  AdminLoginModel? data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> adminLogin(
      LoginModelAdmin loginModelAdmin, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await loginRepoAdmin.login(loginModelAdmin);
    print('inside admin login method');
    _isLoading = false;
    if(apiResponse.response != null &&
      apiResponse.response!.statusCode == 200) {
      print('inside 200');
      final adminLoginModel = AdminLoginModel.fromJson(apiResponse.response!.data);
      data = adminLoginModel;
      print(data!.token);
      loginRepoAdmin.saveAdminToken(data!.token);
      loginRepoAdmin.saveAdminName(data!.message[0].adminName);
      loginRepoAdmin.setAdminType(data!.message[0].appUser.toString());
      callback(true, "Login Successfull");
      notifyListeners();
    }else {
      notifyListeners();
    }
  }
}
