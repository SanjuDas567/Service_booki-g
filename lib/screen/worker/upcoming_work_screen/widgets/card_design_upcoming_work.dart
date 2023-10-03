import 'package:flutter/material.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/custom_fonts.dart';
import 'package:glossy_flossy/utils/dimentions.dart';

class CardDesignWorker extends StatelessWidget {
  const CardDesignWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorResources.GLOSSY_FLOSSY_GREY.shade800
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Vehicle Wash',
                    style: poppinsBold.copyWith(
                      color: ColorResources.GLOSSY_FLOSSY_WHITE,
                      fontSize: 16
                    ),),
                    Text('',
                style: poppins1.copyWith(
                  color: ColorResources.GLOSSY_FLOSSY_WHITE.withOpacity(.5),
                  fontSize: 15
                ),),
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: ColorResources.GLOSSY_FLOSSY_YELLOW)
                      ),),
                  ),
                  onPressed: (){},
                  child: Text('Direction',
                  style: poppinsBold.copyWith(
                    color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                    fontSize: 14
                  ),),
                )
              ],
            ),
            Divider(
              color: ColorResources.GLOSSY_FLOSSY_WHITE,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date : ',
                style: poppins1.copyWith(
                  color: ColorResources.GLOSSY_FLOSSY_WHITE.withOpacity(.5),
                  fontSize: 15
                ),),
                Text('30/09/2023',
                style: poppins1.copyWith(
                  color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  fontSize: 15
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Location : ',
                style: poppins1.copyWith(
                  color: ColorResources.GLOSSY_FLOSSY_WHITE.withOpacity(.5),
                  fontSize: 15
                ),),
                Text('TVM',
                style: poppins1.copyWith(
                  color: ColorResources.GLOSSY_FLOSSY_YELLOW,
                  fontSize: 15
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}