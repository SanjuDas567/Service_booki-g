import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;
  bool checkbox5 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: Colors.yellow,
          checkColor: Colors.black,
          title: const Text(
            'Wash and Wax',
            style: TextStyle(color: Colors.white),
          ),
          value: checkbox1,
          onChanged: (value) {
            setState(() {
              checkbox1 = value!;
            });
          },
        ),
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          title: const Text(
            'Full Valet',
            style: TextStyle(color: Colors.white),
          ),
          value: checkbox2,
          onChanged: (value) {
            setState(() {
              checkbox2 = value!;
            });
          },
        ),
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          title: const Text(
            'Interior Valet',
            style: TextStyle(color: Colors.white),
          ),
          value: checkbox3,
          onChanged: (value) {
            setState(() {
              checkbox3 = value!;
            });
          },
        ),
        CheckboxListTile(
          checkColor: Colors.black,
          activeColor: Colors.yellow,
          title: const Text(
            'Full Detail',
            style: TextStyle(color: Colors.white),
          ),
          value: checkbox4,
          onChanged: (value) {
            setState(() {
              checkbox4 = value!;
            });
          },
        ),
        CheckboxListTile(
          activeColor: Colors.yellow,
          checkColor: Colors.black,
          title: const Text(
            'Engine Steam Wash',
            style: TextStyle(color: Colors.white),
          ),
          value: checkbox5,
          onChanged: (value) {
            setState(() {
              checkbox5 = value!;
            });
          },
        ),
      ],
    );
  }
}
