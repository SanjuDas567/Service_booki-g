import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/subcription/widgets/card_subscription_details.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class VehicleSubscription extends StatelessWidget {
  const VehicleSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          Text(
            'Vehicle Subscription',
            style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 450, // Adjust as you wish
            child: CustomCarouselFB2(),
          ),
        ],
      ),
    );
  }
}
