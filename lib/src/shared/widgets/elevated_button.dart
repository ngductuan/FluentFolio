import 'package:fluentfolio/src/constants/styles.dart';
import 'package:flutter/material.dart';

class ElevatedCustom extends StatefulWidget {
  const ElevatedCustom(
      {super.key,
      required this.title,
      this.ontap,
      this.height = spacing16,
      this.width,
      this.color,
      this.textStyle,
      this.radius = 16.0,
      this.elevation = 0});

  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final TextStyle? textStyle;
  final double radius;
  final double elevation;
  final Function()? ontap;

  @override
  State<ElevatedCustom> createState() => _ElevatedCustomState();
}

class _ElevatedCustomState extends State<ElevatedCustom> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.elevation,
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      color: widget.color ?? AppColor.mainColor2,
      child: InkWell(
        onTap: () {},
        splashColor: AppColor.background.shade200,
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: widget.color ?? AppColor.mainColor2),
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: padding16, horizontal: padding8),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: widget.textStyle ??
                  AppTextStyle(context)
                      .getDefaultStyle()
                      .setColor(AppColor.defaultFontLight)
                      .bold,
            ),
          ),
        ),
      ),
    );
  }
}
