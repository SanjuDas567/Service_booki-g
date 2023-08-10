import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/profile_details_model.dart';
import 'package:glossy_flossy/provider/worker/repo/profile_worker_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class ProfileProviderWorker extends ChangeNotifier{
  final ProfileWorkerRepo profileWorkerRepo;
  ProfileProviderWorker({required this.profileWorkerRepo});

  bool _isProfileLoading = false;
  bool get isProfileLoading => _isProfileLoading;

  WorkerProfileModel? workerProfileModel;
  List<WorkerCard>? workerCard;
  List<Screen>? screen;

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
}