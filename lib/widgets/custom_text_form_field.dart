import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;
  final Widget? suffixIcon;
  final bool? readOnly;
  final bool allowSpecialCharactersAndNumbers;
  final dynamic regExp;

  const AppTextFormField({
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.suffixIcon,
    this.readOnly,
    this.allowSpecialCharactersAndNumbers = true,
    this.regExp,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      readOnly: readOnly ?? false,
      controller: controller,
      maxLines: maxLine ?? 1,
      textCapitalization: capitalization,
      maxLength: isPhoneNumber ? 10 : null,
      focusNode: focusNode,
      keyboardType: textInputType ?? TextInputType.text,
      //keyboardType: TextInputType.number,
      initialValue: null,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: (v) {
        if (nextNode != null) {
          FocusScope.of(context).requestFocus(nextNode);
        }
      },
      inputFormatters: [
        isPhoneNumber
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter,
        allowSpecialCharactersAndNumbers
            ? FilteringTextInputFormatter.allow(RegExp(regExp))
            : FilteringTextInputFormatter.deny(RegExp(regExp)),
      ],
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
