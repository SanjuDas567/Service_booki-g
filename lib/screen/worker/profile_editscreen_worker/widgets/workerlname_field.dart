import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerLastNameField extends StatelessWidget {
  final TextEditingController? controller;

  const WorkerLastNameField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Last Name',
      regExp: r'^[a-zA-Z ]+$',
      textInputType: TextInputType.text,
    );
  }
}