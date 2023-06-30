import 'dart:io';
import 'package:dio/dio.dart';
import 'package:glossy_flossy/data/dio/endpoints.dart';
import 'package:glossy_flossy/data/login_interceptor/loginInterceptor.dart';
import 'package:glossy_flossy/data/shared_preference/shared_preference.dart';

class DioClient {
  final String? baseUrl;
  final LoggingInterseptor? loggingInterseptor;
  final SharedPreferencesProvider? sharedPreferences;

  late Dio dio;
  late String token;

  DioClient(
    this.baseUrl, {
    this.loggingInterseptor,
    this.sharedPreferences,
  }) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl!,
         connectTimeout: Duration(milliseconds: Endpoints.connectionTimeout),
         receiveTimeout: Duration(milliseconds: Endpoints.receiveTimeout),
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Content-Type'] = 'application/json; charset=UTF-8';
        if (sharedPreferences != null) {
          final token = sharedPreferences!.getToken();
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    if (loggingInterseptor != null) {
      dio.interceptors.add(loggingInterseptor!);
    }
  }
  // DioClient(
  //   this.baseUrl,
  //   Dio dioC, {
  //   this.loggingInterseptor,
  //   this.sharedPreferences,
  // }) {
  //   token = sharedPreferences!.saveToken(AppConstants.token);
  //   print("NNNN $token");
  //   dio = dioC ?? Dio();
  //   dio
  //     ..options.baseUrl = baseUrl!
  //     ..options.connectTimeout = Endpoints.connectionTimeout as Duration?
  //     ..options.receiveTimeout = Endpoints.receiveTimeout as Duration?
  //     ..httpClientAdapter
  //     ..options.headers = {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token'
  //     };
  //   dio.interceptors.add(loggingInterseptor!);
  // }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  // Update:--------------------------------------------------------------------
}
