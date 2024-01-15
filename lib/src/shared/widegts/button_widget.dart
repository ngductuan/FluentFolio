import 'package:fluentfolio/src/constants/color_constants.dart';
import 'package:fluentfolio/src/constants/dim_constants.dart';
import 'package:fluentfolio/src/constants/textstyle_constant.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.ontap});

  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(title, style: TextStyles.defaultStyle.bold.whiteTextColor,),
      ),
    );
  }
}
