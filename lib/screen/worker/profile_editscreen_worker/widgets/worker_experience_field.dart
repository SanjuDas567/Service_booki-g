import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerExperienceField extends StatelessWidget {
  final TextEditingController? controller;

  const WorkerExperienceField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Work Experience',
      regExp: r'^[a-zA-Z0-9\s\.,\-]+$',
      textInputType: TextInputType.text,
    );
  }
}