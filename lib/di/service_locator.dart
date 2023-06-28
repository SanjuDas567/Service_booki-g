import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/login_interceptor/loginInterceptor.dart';
import 'package:glossy_flossy/data/shared_preference/shared_preference.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/repo/auth_repo_user.dart';
import 'package:glossy_flossy/utils/app_constants.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  // sl.registerSingleton(Dio(sl()));
  sl.registerSingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(AppConstants.apiBaseURL, sl(),
          loggingInterseptor: sl(), sharedPreferences: sl())
      .get);
  sl.registerLazySingleton<LoggingInterseptor>(() => LoggingInterseptor());
  sl.registerLazySingleton(() => SharedPreferencesProvider());

  // User:----------------------------------------------------------------------
  sl.registerLazySingleton(() => AuthProvider());
  sl.registerFactory(
      () => AuthRepoUser(dioClient: sl(), sharedPreferences: sl()));
}
