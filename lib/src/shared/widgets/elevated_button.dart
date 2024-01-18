import 'package:fluentfolio/src/constants/styles.dart';
import 'package:flutter/material.dart';

class ElevatedCustom extends StatelessWidget {
  const ElevatedCustom(
      {super.key,
      required this.title,
      this.ontap,
      this.height = spacing16,
      this.width,
      this.color,
      this.textStyle,
      this.radius = 16.0});

  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final TextStyle? textStyle;
  final double radius;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: padding16, horizontal: padding8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color ?? AppColor.mainColor2),
        alignment: Alignment.center,
        child: Text(
          title,
          style: textStyle ?? AppTextStyle.defaultStyle.bold,
        ),
      ),
    );
  }
}
