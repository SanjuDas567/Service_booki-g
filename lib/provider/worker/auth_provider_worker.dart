import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_login_model.dart';
import 'package:glossy_flossy/models/worker/worker_login_response_203_model.dart';
import 'package:glossy_flossy/models/worker/worker_login_respose_model.dart';
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

  WorkerLoginApiResponse200Model? workerLoginApiResponse200Model;
  WorkerLoginApiResponse203Model? workerLoginApiResponse203Model;

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
    print(apiResponse.response!.statusCode.toString());
    if (apiResponse.response?.statusCode == 200) {
      print("inside 200");
      final workerLoginApiResponse =
          WorkerLoginApiResponse200Model.fromJson(apiResponse.response!.data);
      workerLoginApiResponse200Model = workerLoginApiResponse;
      authWorkerRepo.saveWorkerToken(workerLoginApiResponse200Model!.token);
      authWorkerRepo.saveWorkerName(
          workerLoginApiResponse200Model!.message[0].empFirstname +
              workerLoginApiResponse200Model!.message[0].empLastname);
      authWorkerRepo.saveWorkerId(
          workerLoginApiResponse200Model!.message[0].empId.toString());
      callback(true, 'Worker login sucessfull');
      notifyListeners();
    } else if (apiResponse.response!.statusCode == 203) {
      print("inside 203");
      // final workerLoginApiResponse203 =
      //     workerLoginApiResponse203ModelFromJson(apiResponse.response!.data);
      // workerLoginApiResponse203Model = workerLoginApiResponse203;
      callback(false, apiResponse.response!.data);
      notifyListeners();
    }
    notifyListeners();
  }

  String getWorkerToken() {
    return authWorkerRepo.getWorkerToken();
  }

  String getWorkerName() {
    return authWorkerRepo.getWorkerName();
  }

  String getWorkerId() {
    return authWorkerRepo.getWorkerId();
  }

  String getWorkerType() {
    return authWorkerRepo.getWorkerType();
  }

  Future<bool> clearAllWorkerData() async {
    return await authWorkerRepo.clearAllWorkerData();
  }
}
