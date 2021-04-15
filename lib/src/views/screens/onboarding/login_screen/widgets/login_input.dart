


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class LoginInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomTextStyles.basicH1Regular,
      keyboardType: TextInputType.visiblePassword,
      decoration: CustomInputDecoration(hintText: 'Почта'),
      validator: (String input) {
        if (input.isEmpty) {
          return 'Введите текст';
        } else {
          return null;
        }
      },
    );
  }
}