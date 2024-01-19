import 'package:fluentfolio/src/shared/widgets/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/constants/styles.dart';

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
        padding: const EdgeInsets.all(padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: 300,
                child: ImageHelper.loadFromAsset(AssetHelper.illuSignIn,
                    height: 300)),
            const SizedBox(
              height: spacing16,
            ),
            Text(
              'Sign in to practice your English speaking skill',
              style: AppTextStyle.defaultStyle.fontHeader.bold,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: spacing16,
            ),
            const InputTypeCustom(
              title: 'Email',
              inputType: 'email',
            ),
            const SizedBox(
              height: spacing16,
            ),
            const InputTypeCustom(
              title: 'Password',
              inputType: 'password',
            ),
            const SizedBox(
              height: spacing32,
            ),
            const ElevatedCustom(
              title: 'Sign in',
              radius: radius24,
            )
          ],
        ),
      ),
    );
  }
}
