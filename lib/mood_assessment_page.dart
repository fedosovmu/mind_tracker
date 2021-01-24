import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'metrics.dart';


class MoodAssessmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Как ваше настроение?',
          style: TextStyle(fontSize: dp(20)),
        ),
        leading:
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {}
          )
        ,
        backgroundColor: AppColors.moodAssessmentPage['backgroundColor'],
        elevation: 0,
      ),
      body: Container(
        color: AppColors.moodAssessmentPage['backgroundColor'],
      ),
    );
  }
}