import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final bool? isPhoneNumber;
  final bool? isValidator;
  final String? validatorMessage;
  final TextCapitalization? capitalization;
  final Color? fillcolor;
  final Widget? suffixIcon;
  final bool? readOnly;

  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.textInputType,
      this.maxLine,
      this.focusNode,
      this.nextNode,
      this.isPhoneNumber,
      this.isValidator = false,
      this.validatorMessage,
      this.capitalization,
      this.fillcolor,
      this.suffixIcon,
      this.readOnly,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isPhoneNumber ?? false
              ? BorderRadius.only(
                  topRight: Radius.circular(6),
                )
              : BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ]),
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        maxLines: maxLine,
        textCapitalization: capitalization ?? TextCapitalization.none,
        maxLength: isPhoneNumber ?? false ? 15 : null,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        initialValue: null,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (value) {
          if (nextNode != null) {
            FocusScope.of(context).requestFocus(nextNode);
          }
        },
        inputFormatters: [
          isPhoneNumber ?? false
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        validator: (input) {
          if (input!.trim().isEmpty) {
            if (isValidator!) {
              FocusScope.of(context).requestFocus(focusNode);
              return validatorMessage;
            }
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: suffixIcon ?? null,
          labelText: hintText ?? '',
          filled: fillcolor != null,
          fillColor: fillcolor,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          isDense: true,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          errorStyle: TextStyle(height: 1.5),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
