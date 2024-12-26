import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final Gradient? gradient; // Optional gradient parameter
  final Color? color; // Optional color parameter

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textStyle,
    this.gradient,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? color ?? const Color(0xFF367EBE) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity(vertical: -4),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0, // Remove elevation to prevent shadow on gradient
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}

class CommonNoButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Gradient? gradient; // Optional gradient parameter
  final Color? color;
  const CommonNoButton({super.key,
    required this.text,
    required this.textStyle,
    this.gradient,
    this.color,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? color ?? const Color(0xFF367EBE) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: textStyle),
    );
  }
}

