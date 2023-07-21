import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_register_model.dart';
import 'package:glossy_flossy/models/worker/worker_register_responce_model.dart';
import 'package:glossy_flossy/provider/worker/repo/register_screen_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class RegisterWorkerProvider extends ChangeNotifier {
  final WorkerRegisterRepo workerRegisterRepo;
  RegisterWorkerProvider({required this.workerRegisterRepo});

  TextEditingController avilTimeInputController = TextEditingController();
  TextEditingController avilToTimeInputController = TextEditingController();

  void setTimeInput(String time) {
    avilTimeInputController.text = time;
    notifyListeners();
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
      setTimeInput(formattedTime);
    }
  }

  void setToTimeInput(String time) {
    avilToTimeInputController.text = time;
    notifyListeners();
  }

  Future<void> selectToTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedTime =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
      setToTimeInput(formattedTime);
    }
  }

  bool _isRegistrationLoading = false;
  bool get isRegistrationLoading => _isRegistrationLoading;

  WorkerRegisterResponseModel? workerRegisterResponseModel;

  Future<void> workerRegistration(
    WorkerRegistrationModel workerRegistrationModel,
    Function callback,
    // File images
  ) async {
    _isRegistrationLoading = true;
    notifyListeners();
    try {
      print("inside provider - worker register");
      ApiResponse apiResponse =
          await workerRegisterRepo.workerRegister(workerRegistrationModel);
      _isRegistrationLoading = false;
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        print("inside work reg 200");
        final workerRegisterResponse =
            WorkerRegisterResponseModel.fromJson(apiResponse.response?.data);
        workerRegisterResponseModel = workerRegisterResponse;
        callback(true, workerRegisterResponseModel!.message);
        notifyListeners();
        // avilTimeInputController.clear();
        // avilToTimeInputController.clear();
      } else {
        print(apiResponse.error.toString());
      }
    } catch (e) {}
    notifyListeners();
  }
}
