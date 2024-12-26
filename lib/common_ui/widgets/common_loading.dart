import '../common_colors.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CommonLoading({
    Key? key,
    this.width = double.infinity,
    this.height = 124,
    this.color = CommonColors.orangeFF,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
