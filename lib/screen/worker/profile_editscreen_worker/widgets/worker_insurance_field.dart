import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerInsuranceField extends StatelessWidget {
  final TextEditingController? controller;

  const WorkerInsuranceField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Insurance Number',
      regExp: r'[0-9]',
      textInputType: TextInputType.text,
    );
  }
}