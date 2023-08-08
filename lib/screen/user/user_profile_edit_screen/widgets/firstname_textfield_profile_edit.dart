import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class UserFirstNameField extends StatelessWidget {
  final TextEditingController? controller;
  const UserFirstNameField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      ctrl: controller,
      // validator: validator,
      hintText: 'First Name',
      keyboardType: TextInputType.text,
    );
  }
}
