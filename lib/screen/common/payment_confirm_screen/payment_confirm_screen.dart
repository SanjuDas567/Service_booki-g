// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/dimentions.dart';
import 'package:glossy_flossy/widgets/custom_app_bar.dart';

class PaymentConfirmScreen extends StatelessWidget {
  dynamic amount;
  PaymentConfirmScreen({super.key, required this.amount});

  var tripFee = 5;
  var tax = 15;
  dynamic totalService;

  PaymentConfirmScreen.calculateTotalService({Key? key, required this.amount}) {
    totalService = amount + tripFee + tax;
  }

  @override
  Widget build(BuildContext context) {
    var totalPayment =
        PaymentConfirmScreen.calculateTotalService(amount: amount);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorResources.GLOSSY_FLOSSY_YELLOW),
        onPressed: () {},
        child: Text('Place Booking',
            style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_BLACK,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: ColorResources.GLOSSY_FLOSSY_BLACK,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(isBackButton: 1, isNotification: 1),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Checkout',
                          style: poppinsRegular.copyWith(
                              color: ColorResources.GLOSSY_FLOSSY_WHITE,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service Subtotal',
                            style: TextStyle(
                                color: ColorResources.GLOSSY_FLOSSY_WHITE),
                          ),
                          Text(
                            amount.toString(),
                            style: TextStyle(
                                color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trip fee',
                            style: TextStyle(
                                color: ColorResources.GLOSSY_FLOSSY_WHITE),
                          ),
                          Text(
                            tripFee.toString(),
                            style: TextStyle(
                                color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(
                                color: ColorResources.GLOSSY_FLOSSY_WHITE),
                          ),
                          Text(
                            tax.toString(),
                            style: TextStyle(
                                color: ColorResources.GLOSSY_FLOSSY_YELLOW),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.white60,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Service Cost',
                        style: TextStyle(
                            color: ColorResources.GLOSSY_FLOSSY_WHITE,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalPayment.totalService.toString(),
                        style: TextStyle(
                            color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: Divider(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
