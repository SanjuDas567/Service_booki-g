import 'package:flutter/material.dart';

class ServiceDetailItemWorker extends StatelessWidget {
  const ServiceDetailItemWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Location',
            style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'GWVF+GVG, Unnamed Road',
            style: TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Car Details',
            style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Car Model : ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              TextSpan(text: 'Porsche', style: TextStyle(color: Colors.white))
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Car Number : ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'DuB 15 C 1456', style: TextStyle(color: Colors.white))
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Date & Time Details',
            style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '20 july 2023',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              // TextSpan(text: 'Porsche', style: TextStyle(color: Colors.white))
            ]),
          ),
          Text(
            '10:30 AM',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Services',
            style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 19),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Engine Detailing',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '\$ 58',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Interior Cleaning',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                '\$ 80',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
              Text(
                '\$ 138',
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              ),
            ],
          )
        ],
      ),
    );
  }
}
