// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class VehicleNumberField extends StatelessWidget {
  final TextEditingController? controller;

  final FocusNode lastNameFocus;
  const VehicleNumberField({
    Key? key,
    this.controller,
    required this.lastNameFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Vehicle Number',
      controller: controller,
      focusNode: lastNameFocus,
    );
  }
}
