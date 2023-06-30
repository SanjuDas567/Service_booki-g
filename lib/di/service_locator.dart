import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/login_interceptor/loginInterceptor.dart';
import 'package:glossy_flossy/data/shared_preference/shared_preference.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/repo/auth_repo_user.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton(() => DioClient(AppConstants.BASE_URL,
      loggingInterseptor: sl(), sharedPreferences: sl()));

  // External:------------------------------------------------------------------
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterseptor());

  // User:----------------------------------------------------------------------
  sl.registerLazySingleton(() => AuthProvider(authRepoUser: sl()));
  sl.registerLazySingleton(() => AuthRepoUser(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SharedPreferencesProvider());

}
