import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function? validator;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;

  const AppTextFormField(
      {Key? key,
      this.ctrl,
      this.hintText,
      this.keyboardType,
      this.onFieldSubmitted,
      this.focusNode,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      keyboardType: keyboardType,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      style: TextStyle(color: Colors.white),
      onFieldSubmitted: (value) => onFieldSubmitted!(value),
      // validator: (input) => validator!(input),
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(hintText.toString()),
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: Colors.yellowAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.yellow),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.yellow))),
    );
  }
}
