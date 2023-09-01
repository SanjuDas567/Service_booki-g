import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerEmailField extends StatelessWidget {
  final TextEditingController? controller;

  const WorkerEmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Email',
      allowSpecialCharactersAndNumbers: false,
      regExp: r'',
      textInputType: TextInputType.text,
    );
  }
}