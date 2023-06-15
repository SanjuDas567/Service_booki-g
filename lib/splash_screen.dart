import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/images.dart';

class SplashScreen extends StatefulWidget {
  final int duration;
  final Widget navigateAfterSplash;

  SplashScreen({required this.duration, required this.navigateAfterSplash});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: widget.duration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.navigateAfterSplash),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset(Images.GLOSSY_FLOSSY_LOGO)),
    );
  }
}
