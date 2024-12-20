import 'package:fluentfolio/src/features/authentication/presentation/views/reset_password.dart';
import 'package:fluentfolio/src/features/authentication/presentation/views/sign_up_view.dart';
import 'package:fluentfolio/src/features/authentication/presentation/widgets/other_sign_in_icon.dart';
import 'package:fluentfolio/src/shared/widgets/buttons/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_fields.dart/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  static String routeName = '/sign_in_view';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                  child: ImageHelper.loadFromAsset(AssetHelper.illuSignIn)),
              const SizedBox(height: spacing16),
              Text(
                TextDoc.txtSignInIntroduction,
                style: AppTextStyle(context).getDefaultStyle().fontHeader.bold,
                textAlign: TextAlign.start,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: spacing16),
                    const FormTextFieldCustom(
                      title: TextDoc.txtEmail,
                      inputType: 'email',
                    ),
                    const SizedBox(height: spacing16),
                    const FormTextFieldCustom(
                      title: TextDoc.txtPassword,
                      inputType: 'password',
                    ),
                    const SizedBox(height: spacing32),
                    ElevatedCustom(
                      title: 'Sign in',
                      radius: radius24,
                      ontap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Do something with the saved data
                          //   print('Name: $_name');
                          //   print('Email: $_email');
                          //   print('Date: $_selectedDate');
                          // }
                          // Fluttertoast.showToast(msg: 'Validted');
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: spacing32, bottom: spacing24),
                child: Center(
                  child: Text(
                    TextDoc.txtOrLoginWith,
                    style: AppTextStyle(context).getDefaultStyle(),
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  width: 250, // isApple ? 150 ? 250
                  height: 40,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OtherSignInIcon(
                        imagePath: AssetHelper.logoGoogle,
                      ),
                      OtherSignInIcon(
                        imagePath: AssetHelper.logoFacebook,
                      ),
                      OtherSignInIcon(
                        imagePath: AssetHelper.logoApple,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing32),
                child: Center(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ResetPasswordView.routeName);
                  },
                  child: Text(
                    TextDoc.txtForgotPassword,
                    style: AppTextStyle(context)
                        .getDefaultStyle()
                        .setColor(AppColor.mainColor1)
                        .semibold,
                  ),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: spacing48, top: spacing16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TextDoc.txtHaveNoAccount,
                        style: AppTextStyle(context).getDefaultStyle()),
                    const SizedBox(width: spacing12),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpView.routeName);
                      },
                      child: Text(
                        TextDoc.txtSignUp,
                        style: AppTextStyle(context)
                            .getDefaultStyle()
                            .setColor(AppColor.mainColor1)
                            .semibold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
