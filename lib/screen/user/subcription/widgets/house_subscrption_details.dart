import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class HouseSubscription extends StatelessWidget {
  const HouseSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'House Subscription',
            style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
