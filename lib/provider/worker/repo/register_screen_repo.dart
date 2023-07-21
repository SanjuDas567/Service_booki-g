import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/worker/form_data/worker_register_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class WorkerRegisterRepo {
  final DioClient dioClient;

  WorkerRegisterRepo({required this.dioClient});
  Future<ApiResponse> workerRegister(
    WorkerRegistrationModel workerRegistrationModel,
    // File? Image,
  ) async {
    try {
      print("/*********************/");
      print("emp_firstname: ${workerRegistrationModel.empFirstname}");
      print("emp_lastname: ${workerRegistrationModel.empLastname}");
      print("emp_phone: ${workerRegistrationModel.empPhone}");
      print("emp_address: ${workerRegistrationModel.empAddress}");
      print("emp_location: ${workerRegistrationModel.empLocation}");
      print("WorkAvl_from: ${workerRegistrationModel.workAvlFrom}");
      print("work_avl_to: ${workerRegistrationModel.workAvlTo}");
      print("experience: ${workerRegistrationModel.experience}");
      print("isuence_id: ${workerRegistrationModel.isuenceId}");
      print("trining_course: ${workerRegistrationModel.triningCourse}");
      print("emp_password: ${workerRegistrationModel.empPassword}");
      print("emp_email: ${workerRegistrationModel.empEmail}");
      print("/*********************/");
      final response = await dioClient.post(
          AppConstants.WORKER_REGISTRATION_URI,
          data: workerRegistrationModel.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e);
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
