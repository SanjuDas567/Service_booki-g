import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class CustomMultilineTextField extends StatelessWidget {
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
  final bool allowSpecialCharactersAndNumbers;
  final dynamic regExp;

  CustomMultilineTextField(
      {this.controller,
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
      this.allowSpecialCharactersAndNumbers = true,
      this.regExp});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorResources.GLOSSY_FLOSSY_BLACK,
        borderRadius: isPhoneNumber
            ? const BorderRadius.only(
                topRight: Radius.circular(6), bottomRight: Radius.circular(6))
            : BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextFormField(
        //expands: true,
        controller: controller,
        maxLines: 5,
        minLines: 3,
        textCapitalization: capitalization,
        //   maxLength: isPhoneNumber ? 15 : null,
        focusNode: focusNode,
        keyboardType: TextInputType.multiline,
        initialValue: null,
        style: TextStyle(color: Colors.white),
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        //autovalidate: true,
        inputFormatters: [
          // isPhoneNumber
          //     ? FilteringTextInputFormatter.digitsOnly
          //     : FilteringTextInputFormatter.singleLineFormatter,

              allowSpecialCharactersAndNumbers
            ? FilteringTextInputFormatter.allow(RegExp(regExp))
            : FilteringTextInputFormatter.deny(RegExp(regExp)),
        ],
        // validator: (input) {
        //   if (input.trim().isEmpty) {
        //     if (isValidator) {
        //       focusNode.requestFocus();
        //       return validatorMessage ?? "";
        //     }
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
          labelText: hintText ?? '',
          filled: fillColor != null,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          isDense: true,
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          counterText: '',
          focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: ColorResources.GLOSSY_FLOSSY_YELLOW)),
          //hintStyle:
          //   titilliumRegular.copyWith(color: Theme.of(context).hintColor),
          errorStyle: TextStyle(height: 1.5),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.yellow)),
        ),
      ),
    );
  }
}
