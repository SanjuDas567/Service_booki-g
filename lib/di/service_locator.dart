import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glossy_flossy/data/dio/dio_client.dart';
import 'package:glossy_flossy/data/login_interceptor/loginInterceptor.dart';
import 'package:glossy_flossy/data/shared_preference/shared_preference.dart';
import 'package:glossy_flossy/provider/user/commercial_providder.dart';
import 'package:glossy_flossy/provider/user/google_map_provider.dart';
import 'package:glossy_flossy/provider/user/home_screen_provider.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/register_provider_user.dart';
import 'package:glossy_flossy/provider/user/repo/auth_repo_user.dart';
import 'package:glossy_flossy/provider/user/repo/commercial_repo.dart';
import 'package:glossy_flossy/provider/user/repo/home_screen_repo.dart';
import 'package:glossy_flossy/provider/user/repo/house_keeping_repo.dart';
import 'package:glossy_flossy/provider/user/repo/register_repo.dart';
import 'package:glossy_flossy/provider/user/repo/user_profile_repo.dart';
import 'package:glossy_flossy/provider/user/repo/vehicle_repo.dart';
import 'package:glossy_flossy/provider/user/user_profile_provider.dart';
import 'package:glossy_flossy/provider/user/vehicle_booking_provider.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/register_screen_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/repo/auth_worker_repo.dart';
import 'package:glossy_flossy/provider/worker/repo/register_screen_repo.dart';
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
  sl.registerLazySingleton(
      () => AuthRepoUser(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SharedPreferencesProvider());
  sl.registerFactory(() => UserProvider(registerRepo: sl()));
  sl.registerLazySingleton(() => RegisterRepo(dioClient: sl()));
  sl.registerFactory(() => HomeScreenProvider(homeScreenRepo: sl()));
  sl.registerLazySingleton(() => HomeScreenRepo(dioClient: sl()));
  sl.registerFactory(() => CommercialBookingProvider(commercialRepo: sl()));
  sl.registerLazySingleton(() => CommercialRepo(dioClient: sl()));
  sl.registerFactory(() => VehicleBookingProvider(vehicleRepo: sl()));
  sl.registerLazySingleton(() => VehicleRepo(dioClient: sl()));
  sl.registerFactory(() => HouseKeepingProvider(houseKeepingRepo: sl()));
  sl.registerLazySingleton(() => HouseKeepingRepo(dioClient: sl()));
  sl.registerFactory(() => GoogleMapProvider());
  sl.registerFactory(() => UserProfileProvider(sl()));
  sl.registerLazySingleton(() => UserProfileRepo(sl()));

  // Worker :-------------------------------------------------------------------
  sl.registerFactory(() => RegisterWorkerProvider(workerRegisterRepo: sl()));
  sl.registerLazySingleton(() => WorkerRegisterRepo(dioClient: sl()));
  sl.registerFactory(() => AuthProviderWorker(authWorkerRepo: sl()));
  sl.registerLazySingleton(
      () => AuthWorkerRepo(dioClient: sl(), sharedPreferences: sl()));

}
