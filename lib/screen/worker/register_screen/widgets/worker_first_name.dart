import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerFirstNameField extends StatelessWidget {
  final TextEditingController? controller;
  final Function? validator;
  const WorkerFirstNameField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hintText: 'First Name',
      textInputType: TextInputType.text,
      regExp: r'^[a-zA-Z ]+$',
    );
  }
}
