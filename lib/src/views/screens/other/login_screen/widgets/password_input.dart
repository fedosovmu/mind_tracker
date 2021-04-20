import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class PasswordInput extends StatelessWidget {
  final TextEditingController controller;

  PasswordInput(this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: CustomTextStyles.basicH1Regular,
      obscureText: true,
      decoration: CustomInputDecoration(hintText: 'Пароль'),
      validator: (String input) {
        if (input.isEmpty) {
          return 'Введите пароль';
        }
        if (input.length < 8) {
          return 'Пароль должен быть не меньше 8 символов';
        }
        return null;
      },
    );
  }
}