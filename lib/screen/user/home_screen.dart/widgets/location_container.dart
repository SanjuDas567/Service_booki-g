import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(Icons.location_on_outlined)),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'location',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade700),
                      ),
                      Text(
                        'Birmingham, England',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
