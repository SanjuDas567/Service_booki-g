import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class UserLastNameField extends StatelessWidget {
  final TextEditingController? controller;
  const UserLastNameField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Last Name',
      textInputType: TextInputType.text,
    );
  }
}
