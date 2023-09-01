import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/form_data/edit_profile_model.dart';
import 'package:glossy_flossy/models/worker/profile_details_model.dart';
import 'package:glossy_flossy/provider/worker/repo/profile_worker_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProviderWorker extends ChangeNotifier{
  final ProfileWorkerRepo profileWorkerRepo;
  ProfileProviderWorker({required this.profileWorkerRepo});

  // time
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
  //  time

  bool _isProfileLoading = false;
  bool get isProfileLoading => _isProfileLoading;

  bool _isProfileUpdateLoading = false;
  bool get isProfileUpdateLoading => _isProfileUpdateLoading;

  WorkerProfileModel? workerProfileModel;
  List<WorkerCard>? workerCard;
  List<Screen>? screen;

  File? _editProfileImage;
  File? get editProfileImage => _editProfileImage;

  Future<void> pickEditImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _editProfileImage = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<void> getWorkerDetails(String workerId) async {
    _isProfileLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await profileWorkerRepo.getWorkerDetail(workerId);
    _isProfileLoading = false;
    if(apiResponse.response != null &&
       apiResponse.response!.statusCode == 200) {
      print('inside the worker data 200');
      final profileModel = WorkerProfileModel.fromJson(apiResponse.response!.data);
      workerProfileModel = profileModel;
      workerCard = workerProfileModel!.data.card;
      screen = workerProfileModel!.data.screen;
      print('inside get worker');
    }else{
      print(apiResponse.error.toString());
    }
    notifyListeners();

    }

  Future<void> updateWorkerData(UpdateProfileData updateProfileData, Function callback) async {
    _isProfileUpdateLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await profileWorkerRepo.updateProfileData(updateProfileData, _editProfileImage!);
    _isProfileUpdateLoading = false;
    if(apiResponse.response != null &&
        apiResponse.response!.statusCode == 200){
      print("inside update worker 200");
      callback(true, 'Profile update successfully');
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
    notifyListeners();
  }
}