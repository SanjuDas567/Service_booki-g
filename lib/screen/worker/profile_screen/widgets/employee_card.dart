import 'package:flutter/material.dart';
import 'package:glossy_flossy/models/worker/profile_details_model.dart';
import 'package:glossy_flossy/utils/color_resources.dart';
import 'package:glossy_flossy/utils/date_cconverter.dart';

// ignore: must_be_immutable
class EmployeeCard extends StatelessWidget {
  WorkerCard card;
  EmployeeCard({required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.yellow,
            Colors.amberAccent,
            Colors.yellow.shade300,
            // Colors.white,
            ColorResources.GLOSSY_FLOSSY_YELLOW,
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
                  card.isuenceId,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  card.empName.toUpperCase(),
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
                    Text(
                        '${DateConverter.isoStringToLocalTimeOnly(card.workAvlFrom)}-${DateConverter.isoStringToLocalTimeOnly(card.workAvlTo)}')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Work Experience',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(card.experience)
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
