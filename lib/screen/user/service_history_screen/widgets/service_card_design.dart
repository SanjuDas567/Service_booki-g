import 'package:flutter/material.dart';
import 'package:glossy_flossy/screen/user/service_detail_screen/service_details_screen.dart';
import 'package:glossy_flossy/utils/images.dart';

class ServiceCardDesign extends StatelessWidget {
  const ServiceCardDesign({super.key});

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
              Image.asset(Images.CAR_WASHING),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Car Washing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Car : ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Porsche',
                            style: TextStyle(color: Colors.black))
                      ]),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Date and Time : ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(.8),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '10:30 AM 20 july 2023',
                            style: TextStyle(color: Colors.black))
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
                                'Engine detailing, interior cleaing, polish and wash',
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
                            builder: (context) => ServiceDetailsScreen()));
                  },
                  child: Text('More Details'))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
