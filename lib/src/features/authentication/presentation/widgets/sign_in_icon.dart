import 'dart:ffi';

import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class SignInIcon extends StatelessWidget {
  const SignInIcon({
    super.key,
    this.alignment,
    required this.imagePath,
    required this.flex,
  });

  final Alignment? alignment;
  final String imagePath;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: alignment ?? Alignment.center,
        child: GestureDetector(
            onTap: () {},
            child: SizedBox(
                height: 40, child: ImageHelper.loadFromAsset(imagePath))),
      ),
    );
  }
}
