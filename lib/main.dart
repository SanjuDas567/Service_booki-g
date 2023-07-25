import 'package:flutter/material.dart';
import 'package:glossy_flossy/di/service_locator.dart' as di;
import 'package:glossy_flossy/provider/admin/login_provider_admin.dart';
import 'package:glossy_flossy/provider/user/add_vehicle_provider.dart';
import 'package:glossy_flossy/provider/user/commercial_providder.dart';
import 'package:glossy_flossy/provider/user/home_screen_provider.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/user/register_provider_user.dart';
import 'package:glossy_flossy/provider/user/review_screen_provider.dart';
import 'package:glossy_flossy/provider/user/vehicle_booking_provider.dart';
import 'package:glossy_flossy/provider/worker/home_screen_worker_provider.dart';
import 'package:glossy_flossy/provider/worker/auth_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/register_screen_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/worker_details_provider_worker.dart';
import 'package:glossy_flossy/screen/user/main_screen.dart/main_screen.dart';
import 'package:glossy_flossy/splash_screen.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/user_selection_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(MultiProvider(
    providers: [
      //user provider:----------------------------------------------------------
      ////
      ////
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => di.sl<AuthProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => di.sl<HomeScreenProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => di.sl<HouseKeepingProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => AddNewVehicleProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ReviewProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => di.sl<UserProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => di.sl<CommercialBookingProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => di.sl<VehicleBookingProvider>(),
      ),
      ////
      ////

      //admin provider:---------------------------------------------------------
      ////
      ////

      ChangeNotifierProvider(
        create: (context) => LoginProviderAdmin(),
      ),
      ////
      ////

      //worker provider:--------------------------------------------------------
      ////
      ////

      ChangeNotifierProvider(
        create: (context) => di.sl<AuthProviderWorker>(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeScreenProviderWorker(),
      ),
      ChangeNotifierProvider(
        create: (context) => WorkerDetailsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => di.sl<RegisterWorkerProvider>(),
      )
      ////
      ////
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final token =
        Provider.of<AuthProvider>(context, listen: false).getUserToken();
    final wtoken = Provider.of<AuthProviderWorker>(context, listen: false)
        .getWorkerToken();
    final wType =
        Provider.of<AuthProviderWorker>(context, listen: false).getWorkerType();
    print("user token NNNN : ${token} \n worker token NNNN : ${wtoken} ");
    return MaterialApp(
      title: 'Glossy Flossy',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: 3, // Duration in seconds for splash screen to be displayed
        navigateAfterSplash: token == ''
            ? UserSelectionScreen()
            : MainScreen(), // Your main app screen
      ),
    );
  }
}
