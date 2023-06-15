import 'package:flutter/material.dart';

class CheckboxWithTitle extends StatelessWidget {
  final bool isChecked;
  final ValueChanged? onChanged;
  final String title;

  const CheckboxWithTitle({
    required this.isChecked,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: Colors.yellow,
        checkColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        value: isChecked,
        onChanged: onChanged);
  }
}
