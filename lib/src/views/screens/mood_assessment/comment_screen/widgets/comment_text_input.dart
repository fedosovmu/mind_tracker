import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_input_decoration.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class CommentTextInput extends StatelessWidget {
  TextEditingController controller;

  CommentTextInput (String text) {
    controller = TextEditingController(text: text);
  }

  @override
  Widget build(BuildContext context) {
    return GlowDisabler(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        style: CustomTextStyles.basicH1Regular,
        autofocus: true,
        decoration: CustomInputDecoration(hintText: 'Твой комментарий'),
      ),
    );
  }
}