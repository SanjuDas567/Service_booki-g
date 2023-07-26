import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/exeption/api_error_handler.dart';
import 'package:glossy_flossy/models/user/user_registration_model.dart';
import 'package:glossy_flossy/utils/api_response.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

class RegisterRepo {
  final DioClient dioClient;

  RegisterRepo({required this.dioClient});
  Future<ApiResponse> registerUser(UserRegistrationModel registerModel) async {
    //   try {
    //     // Validate the user registration model
    //     if (registerModel == null) {
    //       return ApiResponse.withError('Invalid user registration data');
    //     }

    //     if (registerModel.email == null || registerModel.email!.isEmpty) {
    //       return ApiResponse.withError('Email is required');
    //     }

    //     // Create the form data
    //     // var formData = FormData.fromMap({
    //     //   "user_fname": registerModel.userFname,
    //     //   "user_lname": registerModel.userLname,
    //     //   "phone": registerModel.phone,
    //     //   "address": registerModel.address,
    //     //   "email": registerModel.email,
    //     //   "user_pasword": registerModel.userPassword,
    //     // });

    //     // Send the registration request
    //     Response response = await dioClient.post(
    //       AppConstants.REGISTER_URL,
    //       options: Options(
    //         responseType: ResponseType.json
    //       ),
    //       data: registerModel.toJson(),
    //     );

    //     // Handle the response
    //     return ApiResponse.withSuccess(response.data);
    //   } catch (e) {
    //     return ApiResponse.withError(
    //       ApiErrorHandler.getMessage(e),
    //     );
    //   }
    // }
    try {
      print('inside try');
      print(registerModel.email);
      print(registerModel.userPasword);
      final response = await dioClient.post(
        AppConstants.REGISTER_URL,
        data: registerModel.toJson(),
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.getMessage(e),
      );
    }
  }
}
