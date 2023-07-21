// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_login_model.dart';

import 'package:glossy_flossy/provider/worker/repo/auth_worker_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class AuthProviderWorker extends ChangeNotifier {
  final AuthWorkerRepo authWorkerRepo;
  AuthProviderWorker({
    required this.authWorkerRepo,
  });

  bool _obscureValue = true;
  bool get obscureValue => _obscureValue;

  bool _isWorkerLoginLoading = false;
  bool get isWorkerLoginLoading => _isWorkerLoginLoading;

  void changeValueOfObscureText(bool value) {
    _obscureValue = value;
    notifyListeners();
  }

  Future<void> workerLogin(
    LoginModelWorker loginModelWorker,
    Function callback,
  ) async {
    _isWorkerLoginLoading = true;
    notifyListeners();

    ApiResponse apiResponse =
        await authWorkerRepo.workerLogin(loginModelWorker);
    _isWorkerLoginLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      // String? token = apiResponse.response?.data["token"];
      callback(true, 'login sucessfull');
      notifyListeners();
    }
    notifyListeners();
  }
}
