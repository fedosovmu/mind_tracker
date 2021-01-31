import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import '../utils/metrics.dart';


class SignedIcon extends StatelessWidget with Content {
  @override
  Widget build(BuildContext context) {
    loadContent('moodAssessmentScreen');
    return IconButton(
        icon: Image.asset(
        content['pathToCloseIcon'],
        height: dp(32),
        width: dp(32),
      ),
      onPressed: () { print('Bottom menu pressed'); },
    );
  }
}