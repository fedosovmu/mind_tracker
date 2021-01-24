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
          style: TextStyle(
            fontSize: dp(20),
            color: AppColors.moodAssessmentPage['appBarTextColor'],
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.moodAssessmentPage['backgroundColor'],
        //backgroundColor: Colors.red,
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: dp(56),
        leading: Container(
          //color: Colors.yellow,
        ),
        leadingWidth: dp(56),
      ),
      body: Container(
        color: AppColors.moodAssessmentPage['backgroundColor'],
      ),
    );
  }
}