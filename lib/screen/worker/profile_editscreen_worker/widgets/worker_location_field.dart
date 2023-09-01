import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerLocationField extends StatelessWidget {
  final TextEditingController? controller;

  const WorkerLocationField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Location',
      regExp: r'^[a-zA-Z ]+$',
      textInputType: TextInputType.text,
    );
  }
}