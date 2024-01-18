import 'package:fluentfolio/src/constants/dimensions.dart';
import 'package:fluentfolio/src/constants/text_style.dart';
import 'package:flutter/material.dart';

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
          style: AppTextStyle.defaultStyle.fontHeader.bold,
        ),
        const SizedBox(
          height: spacing16,
        ),
        TextField(
          style: AppTextStyle.defaultStyle.fontHeader,
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
