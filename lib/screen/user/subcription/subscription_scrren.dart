import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/subcription/widgets/subscription_tabbar_view.dart';

class SubscrptionScreen extends StatelessWidget {
  const SubscrptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TabBarAndTabViews(),
    );
  }
}