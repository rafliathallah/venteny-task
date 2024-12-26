import '../common_typography.dart';
import 'package:flutter/material.dart';


class CommonSearch extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final Color fillColor;
  final Color hintColor;
  final int? maxLength;
  final Function onChange;

  const CommonSearch(
      {super.key,
        required this.hint,
        this.controller,
        required this.inputType,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText = false,
        this.enabled = true,
        this.fillColor = Colors.white,
        this.hintColor = Colors.grey,
        this.maxLength,
        required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChange(value);
      },
      validator: (val) => val!.isEmpty ? 'required' : null,
      keyboardType: inputType,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: inputType == TextInputType.multiline ? 3 : 1,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        counterText: "",
        fillColor: fillColor,
        filled: true,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: CommonTypography.textInter12.copyWith(color: Colors.grey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle:CommonTypography.textInter12.copyWith(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 0, color: fillColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 0, color: Colors.grey),
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0, color: Colors.grey)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        focusColor: Colors.white,
        hoverColor: Colors.white,
      ),
      cursorColor: Colors.orange,
      style: CommonTypography.textInter12,
    );
  }
}