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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.yellow,
              height: dp(100),
            ),
            Container(
              height: dp(136),
              width: double.infinity,
              padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {print('Assess Mood');},
                    child: Text(
                      'Оценить',
                      style: TextStyle(
                        color: AppColors.moodAssessmentPage['assessMoodButtonTextColor'],
                        fontSize: dp(18),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    color: AppColors.moodAssessmentPage['assessMoodButtonColor'],
                    height: dp(60),
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(dp(16)))
                    ),
                  ),
                  FlatButton(
                    onPressed: () {print('Skip');},
                    child: Text(
                      'Пропустить',
                      style: TextStyle(
                        color: AppColors.moodAssessmentPage['skipButtonTextColor'],
                        fontSize: dp(18),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    height: dp(60),
                    minWidth: double.infinity,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}