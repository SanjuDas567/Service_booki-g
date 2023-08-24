import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/service_history_model.dart';
import 'package:glossy_flossy/provider/worker/repo/worker_service_history_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class WorkerServiceHistoryProvider extends ChangeNotifier {
  final WorkerServiceHistoryRepo workerServiceHistoryRepo;
  WorkerServiceHistoryProvider({required this.workerServiceHistoryRepo});

  bool _isWorkerServiceHistoryLoading = false;
  bool get isWorkerServiceHistoryLoading => _isWorkerServiceHistoryLoading;

  WorkerHistory? workerHistory;

  Future<void> getServiceHistory(String userId) async {
    _isWorkerServiceHistoryLoading = true;
    notifyListeners();
    ApiResponse apiResponse =
        await workerServiceHistoryRepo.getWorkerServiceHistory(userId);
    _isWorkerServiceHistoryLoading = false;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      final history = WorkerHistory.fromJson(apiResponse.response!.data);
      workerHistory = history;
    }
    notifyListeners();
  }
}
