import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class ReviewTextField extends StatelessWidget {
  final TextEditingController? controller;

  // final FocusNode lastNameFocus;
  const ReviewTextField({
    super.key,
    this.controller,
    //  required this.lastNameFocus,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Comments',
      controller: controller,
      // focusNode: lastNameFocus,
      // onFieldSubmitted: () {
      //   FocusScope.of(context).requestFocus(lastNameFocus);
      // },
    );
  }
}
