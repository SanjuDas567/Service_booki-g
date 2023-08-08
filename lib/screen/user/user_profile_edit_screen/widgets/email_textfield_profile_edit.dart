import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class UserEmailField extends StatelessWidget {
  final TextEditingController? controller;
  const UserEmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      ctrl: controller,
      // validator: validator,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
    );
  }
}