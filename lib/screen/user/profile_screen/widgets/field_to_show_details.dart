import 'package:flutter/material.dart';

class CustomFieldProfile extends StatelessWidget {
  final String name;
  final String title;
  const CustomFieldProfile(
      {super.key, required this.name, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.yellow),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 15,
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}
