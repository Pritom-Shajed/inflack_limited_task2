import 'package:flutter/material.dart';
import 'package:inflack_limited_task2/Utils/dimensions.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  TextInputType inputType;
  bool obscureText;
  int? maxLines;
  final TextEditingController controller;

  CustomTextField(
      {Key? key,
      required this.hintText,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.maxLines, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(Dimensions.radius8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(Dimensions.radius8)),
      ),
    );
  }
}
