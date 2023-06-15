import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/home_screen_provider.dart';
import 'package:glossy_flossy/provider/house_keeping_provider.dart';
import 'package:glossy_flossy/provider/login_provider.dart';
import 'package:glossy_flossy/splash_screen.dart';
import 'package:glossy_flossy/screen/common/user_selection_screeen/user_selection_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HouseKeepingProviderUser(),
      ),
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
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        duration: 3, // Duration in seconds for splash screen to be displayed
        navigateAfterSplash: UserSelectionScreen(), // Your main app screen
      ),
    );
  }
}
