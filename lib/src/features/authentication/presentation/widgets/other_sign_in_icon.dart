import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class OtherSignInIcon extends StatelessWidget {
  const OtherSignInIcon({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        child: GestureDetector(
            onTap: () {},
            child: SizedBox(
                height: 40, child: ImageHelper.loadFromAsset(imagePath))),
      ),
    );
  }
}
