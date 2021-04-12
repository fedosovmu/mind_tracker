import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CommentTextInput extends StatelessWidget {
  TextEditingController controller;

  CommentTextInput (String text) {
    controller = TextEditingController(text: text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      style: CustomTextStyles.basicH1Regular,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Твой комментарий',
        hintStyle: CustomTextStyles.basicH1Regular.copyWith(
            color: CustomColors.purpleTextSecondary
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(dp(12))),
        ),
      ),
    );
  }
}