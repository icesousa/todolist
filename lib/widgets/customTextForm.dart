import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {Key? key,
      required this.controller,
      required this.labeltext,
      required this.hinttext,
      this.icon,
      this.validator,
      required this.obscureText,
      required this.keyboardType,
      required this.maxLines})
      : super(key: key);

  final TextEditingController controller;
  final String labeltext;
  final String hinttext;
  final String? Function(String? text)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool obscureText;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          alignLabelWithHint: true,
          border: OutlineInputBorder(),
          labelText: labeltext,
          helperText: '',
          hintText: hinttext),
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText,
    );
  }
}
