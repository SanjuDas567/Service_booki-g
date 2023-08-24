// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/user_service_history_model.dart';

import 'package:glossy_flossy/provider/user/repo/service_history_repo.dart';
import 'package:glossy_flossy/utils/api_response.dart';

class ServiceHistoryProvider extends ChangeNotifier {
  final ServiceHistoryRepo serviceHistoryRepo;

  ServiceHistoryProvider({
    required this.serviceHistoryRepo,
  });

  bool _isServiceHistoryLoading = false;
  bool get isServiceHistoryLoading => _isServiceHistoryLoading;

  ServiceHistoryModel? serviceHistoryModel;

  Future<void> getServiceData(String uId) async {
    _isServiceHistoryLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await serviceHistoryRepo.getServiceHistory(uId);
    _isServiceHistoryLoading = false;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      final serviceHistory =
          ServiceHistoryModel.fromJson(apiResponse.response!.data);

      serviceHistoryModel = serviceHistory;
      // print(serviceHistoryModel!.data[0].customerName);
    }
    notifyListeners();
  }
}
