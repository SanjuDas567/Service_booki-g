import 'package:dio/dio.dart';

class ApiResponse {
  final Response? response;
  final dynamic error;
  ApiResponse(this.response, this.error);

  ApiResponse.withError(dynamic errorValue)
      : response = null,
        error = errorValue;

  ApiResponse.withSuccess(dynamic responseValue)
      : response = responseValue,
        error = null;
}



// class ApiResponse<T> {
//   bool success;
//   T? data;
//   String? errorMessage;

//   ApiResponse({
//     required this.success,
//     this.data,
//     this.errorMessage,
//   });

//   factory ApiResponse.withSuccess(T data) {
//     return ApiResponse<T>(
//       success: true,
//       data: data,
//     );
//   }

//   factory ApiResponse.withError(String errorMessage) {
//     return ApiResponse<T>(
//       success: false,
//       errorMessage: errorMessage,
//     );
//   }
// }
