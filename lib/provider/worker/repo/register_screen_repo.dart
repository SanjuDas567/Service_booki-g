import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/admin/form_data/worker_register_model.dart';
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
      // var formData = FormData.fromMap({
      //   "emp_firstname": workerRegistrationDataModel.empFirstname,
      //   "emp_lastname": workerRegistrationDataModel.empLastname,
      //   "emp_phone": workerRegistrationDataModel.empPhone,
      //   "emp_address": workerRegistrationDataModel.empAddress,
      //   "emp_location": workerRegistrationDataModel.empLocation,
      //   "WorkAvl_from": workerRegistrationDataModel.workAvlFrom,
      //   "work_avl_to": workerRegistrationDataModel.workAvlTo,
      //   "experience": workerRegistrationDataModel.experience,
      //   "isuence_id": workerRegistrationDataModel.isuenceId,
      //   "trining_course": workerRegistrationDataModel.triningCourse,
      //   "emp_password": workerRegistrationDataModel.empPassword,
      //   "emp_email": workerRegistrationDataModel.empEmail,
      //   "emp_profile_pic": null,
      //   "app_user": 2
      // });
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
