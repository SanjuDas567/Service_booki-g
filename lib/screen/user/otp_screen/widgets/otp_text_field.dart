import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glossy_flossy/utils/color_resources.dart';

class OtptextField extends StatelessWidget {
   final TextEditingController otp1;
  final TextEditingController otp2;
  final TextEditingController otp3;
  final TextEditingController otp4;
  final TextEditingController otp5;
  final TextEditingController otp6;
   OtptextField({
    required this.otp1, 
    required this.otp2, 
    required this.otp3, 
    required this.otp4, 
    required this.otp5, 
    required this.otp6,
    });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 68,
            width: 50,
            child: TextField(
              controller: otp1,
              style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
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
            ),
          ),
          SizedBox(
            height: 68,
            width: 50,
            child: TextField(
              controller: otp2,
              style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
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
            ),
          ),
          SizedBox(
            height: 68,
            width: 50,
            child: TextField(
            controller: otp3,
              style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
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
            ),
          ),
          SizedBox(
            height: 68,
            width: 50,
            child: TextField(
              controller: otp4,
              style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
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
            ),
          ),
          SizedBox(
            height: 68,
            width: 50,
            child: TextField(
              controller: otp5,
              style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
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
            ),
          ),
          SizedBox(
            height: 68,
            width: 50,
            child: TextField(
              controller: otp6,
              style: TextStyle(
                color: ColorResources.GLOSSY_FLOSSY_WHITE,
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
               textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.yellow.shade300),
          labelStyle: const TextStyle(color: ColorResources.GLOSSY_FLOSSY_YELLOW),
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
            ),
          ),
          
        ],
      ),
      );
  }
}