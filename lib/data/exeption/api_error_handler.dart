// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';


class ApiErrorHandler {
  static dynamic getMessage(error) {
    print('Error inside handler: $error');
    dynamic errorDescription = '';
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = 'Request to API server was cancelled';
              break;
            case DioErrorType.connectionTimeout:
              errorDescription = 'Connection timeout with API server';
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
                  'Receive time out in connection with API server';
              break;
            default:
              errorDescription = 'Unknown error';
          }
        } else {
          errorDescription = error.toString();
        }
      } catch (e) {
        errorDescription = 'Error getting error message';
      }
    }
    return errorDescription;
  }
}
// class ApiErrorHandler {
//   static dynamic getMessage(error) {
//     print('eror inside handler: $error');
//     dynamic errorDescription = "";
//     if (error is Exception) {
//       try {
//         if (error is DioError) {
//           switch (error.type) {
//             case DioErrorType.cancel:
//               errorDescription = 'Request to API server was cancelled';
//               break;
//             case DioErrorType.connectionTimeout:
//               errorDescription = 'Connection timeout with API server';
//               break;
//             case DioErrorType.receiveTimeout:
//               errorDescription =
//                   "Connection to API server failed due to internet connection";
//               break;
              
//           }
//         } else {}
//       } catch (e) {}
//     }
//   }
// }
