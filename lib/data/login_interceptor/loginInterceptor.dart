import 'package:dio/dio.dart';

class LoggingInterseptor extends InterceptorsWrapper {
  int maxCharactersPerline = 200;
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('onRequest');

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerline) {
      int iterations = (responseAsString.length / maxCharactersPerline).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerline + maxCharactersPerline;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
      }
    } else {}
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    return super.onError(err, handler);
  }
}
