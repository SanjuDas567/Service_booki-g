import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class AddressField extends StatelessWidget {
  final TextEditingController? controller;
  const AddressField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      // validator: validator,
      hintText: 'Address',
      regExp: r'^[a-zA-Z ]+$',
      textInputType: TextInputType.streetAddress,
    );
  }
}
