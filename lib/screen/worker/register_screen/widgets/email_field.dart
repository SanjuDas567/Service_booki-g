import 'package:flutter/material.dart';
import 'package:glossy_flossy/widgets/custom_text_form_field.dart';

class WorkerEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final Function? validator;
  const WorkerEmailField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      hintText: 'Email',
      textInputType: TextInputType.emailAddress,
      allowSpecialCharactersAndNumbers: false,
      regExp: r'',
    );
  }
}
