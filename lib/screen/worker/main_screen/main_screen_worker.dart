import 'package:flutter/material.dart';

class MainScreenWorker extends StatelessWidget {
  const MainScreenWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Main Screen'),
        ),
      ),
    );
  }
}
