// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fluentfolio/src/constants/dim_constants.dart';
import 'package:fluentfolio/src/constants/dimensions.dart';
import 'package:fluentfolio/src/constants/textstyle_constant.dart';
import 'package:fluentfolio/src/helpers/asset_helper.dart';
import 'package:fluentfolio/src/helpers/image_helpers.dart';

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
            Text(
              'Sign in to practice your English speaking skill',
              style: TextStyles.defaultStyle.fontSubHeader.bold,
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
            )
          ],
        ),
      ),
    );
  }
}

class InputTypeCustom extends StatelessWidget {
  const InputTypeCustom({
    Key? key,
    required this.title,
    required this.inputType,
  }) : super(key: key);

  final String title;
  final String inputType;

  // Function to determine keyboardType based on inputType
  TextInputType _getKeyboardType(String inputType) {
    switch (inputType) {
      case 'email':
        return TextInputType.emailAddress;
      case 'password':
        return TextInputType.visiblePassword;
      // Add more cases as needed
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyles.defaultStyle.fontSubHeader.bold,
        ),
        const SizedBox(
          height: spacing16,
        ),
        TextField(
          style: TextStyles.defaultStyle.fontSubHeader,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusColor: Colors.red,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.yellow[700] ?? Colors.yellow, width: 2),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixIcon:
                inputType == 'password' ? const Icon(Icons.visibility) : null,
          ),
          keyboardType: _getKeyboardType(inputType),
          // textInputAction: TextInputAction.done,
          obscureText: inputType == 'password' ? true : false,
        )
      ],
    );
  }
}
