import 'package:fluentfolio/src/shared/widgets/buttons/elevated_button.dart';
import 'package:fluentfolio/src/shared/widgets/text_fields.dart/text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';
import 'package:fluentfolio/src/constants/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  static String routeName = '/sign_up_view';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool? _termCheck = false;

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
                  child: ImageHelper.loadFromAsset(AssetHelper.illuSignUp)),
              const SizedBox(height: spacing16),
              Text(
                TextDoc.txtSignUpIntroduction,
                style: AppTextStyle(context).getDefaultStyle().fontHeader.bold,
                textAlign: TextAlign.start,
              ),
              Form(
                key: _formKey,
                child: const Column(
                  children: [
                    SizedBox(height: spacing16),
                    TextFieldCustom(
                      title: TextDoc.txtFullName,
                      inputType: 'text',
                    ),
                    SizedBox(height: spacing16),
                    TextFieldCustom(
                      title: TextDoc.txtEmail,
                      inputType: 'email',
                    ),
                    SizedBox(height: spacing16),
                    TextFieldCustom(
                      title: TextDoc.txtPassword,
                      inputType: 'password',
                    ),
                    SizedBox(height: spacing16),
                    TextFieldCustom(
                      title: TextDoc.txtRetypePassword,
                      inputType: 'password',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: spacing24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: _termCheck,
                        activeColor: AppColor.mainColor2,
                        onChanged: (newBool) {
                          _termCheck = newBool;
                          setState(() {});
                        }),
                    Text(TextDoc.txtTermsAccept,
                        style: AppTextStyle(context).getDefaultStyle()),
                    const SizedBox(width: spacing12),
                    Text(
                      TextDoc.txtTerms,
                      style: AppTextStyle(context)
                          .getDefaultStyle()
                          .setColor(AppColor.mainColor1)
                          .semibold,
                    ),
                  ],
                ),
              ),
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
                padding:
                    const EdgeInsets.only(bottom: spacing48, top: spacing32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TextDoc.txtHaveAnAccount,
                        style: AppTextStyle(context).getDefaultStyle()),
                    const SizedBox(width: spacing12),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        TextDoc.txtSignIn,
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
