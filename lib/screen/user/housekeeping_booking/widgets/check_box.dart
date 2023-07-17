import 'package:flutter/material.dart';
import 'package:glossy_flossy/provider/user/house_keeping_provider.dart';
import 'package:glossy_flossy/screen/user/housekeeping_booking/widgets/check_box_code.dart';
import 'package:provider/provider.dart';

class HouseKeepingCheckBox extends StatelessWidget {
  const HouseKeepingCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HouseKeepingProvider>(
      builder: (context, houseKeepingProvider, child) {
        return houseKeepingProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              )
            : CheckBoxCode();
      },
    );
  }
}
