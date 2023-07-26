import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/login_api_response_model.dart';
import 'package:glossy_flossy/models/user/login_api_ressponse_203_model.dart';
import 'package:glossy_flossy/models/user/login_model.dart';
import 'package:glossy_flossy/provider/user/repo/auth_repo_user.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepoUser authRepoUser;
  AuthProvider({required this.authRepoUser});

  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  LoginApiResponseModel? data;
  UserLoginApiResponce203Model? userLoginApiResponce203Model;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }

  // login:---------------------------------------------------------------------

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(
    LoginModel loginBody,
    Function callback,
    // Function callback
  ) async {
    print('******');
    print(loginBody.email);
    print(loginBody.password);
    print('******');
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepoUser.login(loginBody);
    _isLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      print('inside 200');
      print(apiResponse.response!.data);
      Map map = apiResponse.response!.data;
      String token = map["token"];
      print(token);
      final registerApiResponse =
          LoginApiResponseModel.fromJson(apiResponse.response!.data);
      data = registerApiResponse;
      print(data!.message[0].userFname.toString());
      print(data!.token);
      authRepoUser.saveUserToken(data!.token);
      authRepoUser.saveUserName(data!.message[0].userFname);
      authRepoUser.saveUserId(data!.message[0].id.toString());
      authRepoUser.saveUserType(data!.message[0].appUser.toString());
      // await authRepoUser.updateToken();
      // authRepoUser.setIsBuyer(true);

      // int userId = map["user_id"];
      // authRepoUser.saveUserId(userId.toString());
      callback(true, "Login Sucessfull");
      notifyListeners();
    } else if (apiResponse.response!.statusCode == 203) {
      final userLoginApiResponce203 =
          UserLoginApiResponce203Model.fromJson(apiResponse.response!.data);
      userLoginApiResponce203Model = userLoginApiResponce203;
      callback(false, userLoginApiResponce203Model!.message);
    } else {}
    notifyListeners();
  }

  String getUserToken() {
    return authRepoUser.getUserToken();
  }

  String getUserName() {
    return authRepoUser.getUserName();
  }

  String getUserId() {
    return authRepoUser.getUserId();
  }

  String getUserType() {
    return authRepoUser.getUserType();
  }

  Future<bool> clearAllData() async {
    return await authRepoUser.clearAllData();
  }
}
