import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/widgets/other_sign_in_icon.dart';
import 'package:fluentfolio/src/shared/widgets/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/constants/styles.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  static String routeName = '/reset_password_view';

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
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
                  child: ImageHelper.loadFromAsset(
                      AssetHelper.illuForgotPassword)),
              const SizedBox(height: spacing16),
              Text(
                TextDoc.txtResetPasswordIntroduction,
                style: AppTextStyle(context).getDefaultStyle().fontHeader.bold,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: spacing16),
              const TextFieldCustom(
                title: TextDoc.txtEmail,
                inputType: 'email',
              ),
              const SizedBox(height: spacing32),
              const ElevatedCustom(
                title: 'Sign in',
                radius: radius24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing32),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      TextDoc.txtGoToSignIn,
                      style: AppTextStyle(context)
                          .getDefaultStyle()
                          .setColor(AppColor.mainColor1)
                          .semibold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
