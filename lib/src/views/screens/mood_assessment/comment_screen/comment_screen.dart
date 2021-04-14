import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/comment_screen/widgets/comment_text_input.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';


class CommentScreen extends StatelessWidget {
  String _comment;

  CommentScreen(oldComment) {
    _comment = oldComment;
  }

  @override
  Widget build(BuildContext context) {
    final commentTextInput = CommentTextInput(_comment);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Добавление комментария',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Back button pressed');
            Navigator.pop(context);
          }
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(16)),
              child: commentTextInput,
            ),
            Positioned(
              left: dp(16),
              right: dp(16),
              bottom: 0,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: dp(16)),
                child: StandardButton(
                  title: 'Добавить',
                  onPressed: () {
                    print('Add comment button pressed');
                    String comment = commentTextInput.controller.text;
                    Navigator.of(context).pop(comment);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}