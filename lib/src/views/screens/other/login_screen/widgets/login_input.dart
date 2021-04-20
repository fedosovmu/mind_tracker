import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class LoginInput extends StatelessWidget {
  final TextEditingController controller;

  LoginInput(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      style: CustomTextStyles.basicH1Regular,
      keyboardType: TextInputType.emailAddress,
      decoration: CustomInputDecoration(hintText: 'Почта'),
      validator: (String input) {
        if (input.isEmpty) {
          return 'Введите почту';
        }
        final emailRegExp = RegExp('(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\$)');
        final bool isEmailValid = emailRegExp.hasMatch(input);
        if (!isEmailValid) {
          return 'Неверный формат почты';
        }
        return null;
      },
    );
  }
}