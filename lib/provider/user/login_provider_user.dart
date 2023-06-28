import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/login_model.dart';
import 'package:glossy_flossy/provider/user/repo/auth_repo_user.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class AuthProvider extends ChangeNotifier {
  // AuthRepoUser authRepoUser;
  // AuthProvider({required this.authRepoUser});

  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }

  // login:---------------------------------------------------------------------

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Future login(LoginModel loginBody, Function callback) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepoUser.login(loginBody);
  //   _isLoading = false;
  //   if (apiResponse.response != null &&
  //       apiResponse.response.statusCode == 200) {
  //     Map map = apiResponse.response.data;
  //     String token = map["token"];
  //     authBuyerRepo.saveUserToken(token);
  //     await authBuyerRepo.updateToken();
  //     authBuyerRepo.setIsBuyer(true);

  //     int userId = map["user_id"];
  //     authBuyerRepo.saveUserId(userId.toString());
  //     callback(true, token);
  //     notifyListeners();
  //   } else {
  //     String errorMessage;
  //     if (apiResponse.error is String) {
  //       //print(apiResponse.error.toString());
  //       errorMessage = apiResponse.error.toString();
  //     } else {
  //       ErrorResponse errorResponse = apiResponse.error;
  //       //print(errorResponse.errors[0].message);
  //       errorMessage = errorResponse.errors[0].message;
  //     }
  //     callback(false, errorMessage);
  //     notifyListeners();
  //   }
  // }
}
