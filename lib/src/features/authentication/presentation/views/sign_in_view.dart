import 'package:fluentfolio/src/features/authentication/presentation/widgets/sign_in_icon.dart';
import 'package:fluentfolio/src/shared/widgets/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/constants/styles.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  static String routeName = '/sign_in_screen';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: 300,
                  child: ImageHelper.loadFromAsset(AssetHelper.illuSignIn)),
              const SizedBox(height: spacing16),
              Text(
                TextDoc.txtSignInIntroduction,
                style: AppTextStyle.defaultStyle.fontHeader.bold,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: spacing16),
              const TextFieldCustom(
                title: TextDoc.txtEmail,
                inputType: 'email',
              ),
              const SizedBox(height: spacing16),
              const TextFieldCustom(
                title: TextDoc.txtPassword,
                inputType: 'password',
              ),
              const SizedBox(height: spacing32),
              const ElevatedCustom(
                title: 'Sign in',
                radius: radius24,
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: spacing32, bottom: spacing24),
                child: const Center(
                  child: Text(
                    TextDoc.txtOrLoginWith,
                    style: AppTextStyle.defaultStyle,
                  ),
                ),
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SignInIcon(
                    flex: 5,
                    imagePath: AssetHelper.logoFacebook,
                    alignment: Alignment.centerRight,
                  ),
                  SignInIcon(
                    flex: 4,
                    imagePath: AssetHelper.logoGoogle,
                  ),
                  SignInIcon(
                    flex: 5,
                    imagePath: AssetHelper.logoApple,
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
              Center(
                  heightFactor: 3,
                  child: Text(
                    TextDoc.txtForgotPassword,
                    style: AppTextStyle.defaultStyle
                        .setColor(AppColor.mainColor1)
                        .semibold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
