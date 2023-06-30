import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.yellow,
            Colors.amberAccent,
            Colors.yellow.shade200,
            // Colors.white,
            Colors.white
          ]),
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Isurance Id : ',
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text(
                  '654987',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
            // Text(
            //   'Employee Card',
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            Column(
              children: [
                // Text(
                //   'SHAN',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                Text(
                  'SHAN',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Working Time',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('10:30 am - 06: 30 pm')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Work Experience',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('1 year')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
