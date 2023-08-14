import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class UserPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  const UserPhoneField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Phone number',
      textInputType: TextInputType.number,
    );
  }
}