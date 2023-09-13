// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/user/user_service_history_model.dart';
import 'package:glossy_flossy/screen/user/service_detail_screen/service_details_screen.dart';
import 'package:glossy_flossy/utils/app_constants.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/date_cconverter.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceCardDesign extends StatelessWidget {
  final ServiceHistoryData serviceHistoryData;
  ServiceCardDesign({
    required this.serviceHistoryData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              // serviceHistoryData.servImageCarpet == null
              // ? SizedBox.shrink()
              // : Image.network(
              //   AppConstants.BASE_URL +
              //       serviceHistoryData.servImageCarpet.toString(),
              //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              //     return child;
              //   },
              //   loadingBuilder: (context, child, loadingProgress) {
              //     if (loadingProgress == null) {
              //       return child;
              //     } else {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //           color: ColorResources.GLOSSY_FLOSSY_BLACK,
              //         ),
              //       );
              //     }
              //   },
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      serviceHistoryData.serviceType.capitalizeFirstLetter(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    serviceHistoryData.servTypeSlno == 1
                        ? RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Car : ',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.8),
                                        fontWeight: FontWeight.bold)),
                                 TextSpan(
                                    text: serviceHistoryData.vehicleName,
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Date and Time : ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "${DateConverter.estimatedDate(serviceHistoryData.servDate)}",
                            style: const TextStyle(color: Colors.black))
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Services : ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontWeight: FontWeight.bold)),
                         TextSpan(
                            text:
                            serviceHistoryData.serviceName,
                            style: TextStyle(color: Colors.black))
                      ]),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black, primary: Colors.yellow),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ServiceDetailsScreen()));
                  },
                  child: const Text('More Details'))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
