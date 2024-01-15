import 'package:fluentfolio/src/constants/dim_constants.dart';
import 'package:fluentfolio/src/constants/textstyle_constant.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String routeName = '/sign_in_screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 300,
                child: ImageHelper.loadFromAsset(AssetHelper.illuSignIn,
                    height: 300)),
            const SizedBox(
              height: kDefaultPadding,
            ),
            const Text(
              'Sign in to practice your English speaking skill',
              style: TextStyles.defaultStyle,
              textAlign: TextAlign.start,
            ),
            const TextField()
          ],
        ),
      ),
    );
  }
}
