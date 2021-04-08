import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/main_button.dart';
import 'package:mind_tracker/src/views/common_widgets/text_input.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';


class AddCommentScreen extends StatelessWidget {
  static const _pathToBackIcon = 'assets/icons/ui/back.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Добавление комментария',
        leading: IconButton(
          iconSize: dp(32),
          icon: Image.asset(_pathToBackIcon),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(16)),
              child: TextInput(),
            ),
            Positioned(
              left: dp(16),
              right: dp(16),
              bottom: 0,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: dp(8)),
                child: MainButton(
                  title: 'Добавить',
                  onPressed: () {
                    print('Add comment button pressed');
                    Navigator.of(context).pop();
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