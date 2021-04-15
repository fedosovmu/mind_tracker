import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomTextStyles.basicH1Regular,
      obscureText: true,
      decoration: CustomInputDecoration(hintText: 'Пароль'),
    );
  }
}