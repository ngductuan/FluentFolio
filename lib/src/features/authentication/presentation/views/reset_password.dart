import 'package:fluentfolio/src/features/authentication/presentation/views/sign_in_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/widgets/other_sign_in_icon.dart';
import 'package:fluentfolio/src/shared/widgets/buttons/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_fields.dart/form_text_field.dart';
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
  final _formKey = GlobalKey<FormState>();

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
              Form(
                key: _formKey,
                child: const Column(
                  children: [
                    SizedBox(height: spacing16),
                    FormTextFieldCustom(
                      title: TextDoc.txtEmail,
                      inputType: 'email',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: spacing32),
              ElevatedCustom(
                title: 'Sign in',
                radius: radius24,
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // print(_formKey.toString());
                  }
                },
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
