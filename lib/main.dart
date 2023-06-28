import 'package:flutter/material.dart';
import 'package:glossy_flossy/di/service_locator.dart' as di;
import 'package:glossy_flossy/provider/admin/login_provider_admin.dart';
import 'package:glossy_flossy/provider/user/home_screen_provider.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/provider/user/login_provider_user.dart';
import 'package:glossy_flossy/provider/worker/home_screen_worker_provider.dart';
import 'package:glossy_flossy/provider/worker/login_provider_worker.dart';
import 'package:glossy_flossy/provider/worker/worker_details_provider_worker.dart';
import 'package:glossy_flossy/splash_screen.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/user_selection_screen.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  runApp(MultiProvider(
    providers: [
      //user provider:----------------------------------------------------------
      ////
      ////
      // ChangeNotifierProvider(
      //   create: (context) => AuthProvider(),
      // ),
      ChangeNotifierProvider(
        create: (context) => di.sl<AuthProvider>(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HouseKeepingProviderUser(),
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
        create: (context) => LoginProviderWorker(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeScreenProviderWorker(),
      ),
      ChangeNotifierProvider(
        create: (context) => WorkerDetailsProvider(),
      ),
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
    return MaterialApp(
      title: 'Glossy Flossy',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: 3, // Duration in seconds for splash screen to be displayed
        navigateAfterSplash: UserSelectionScreen(), // Your main app screen
      ),
    );
  }
}
