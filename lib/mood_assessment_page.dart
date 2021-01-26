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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildMoodAssessor(),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodAssessor() {
    return Expanded(
      child: Center(
        child: Container(
          height: dp(278),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: dp(209),
                margin: EdgeInsets.symmetric(horizontal: dp(16)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                  color: AppColors.moodAssessmentPage['moodAssessorBackgroundColor'],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: dp(47),
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Нормальное',
                        style: TextStyle(
                          color: AppColors.moodAssessmentPage['moodAssessorMoodTextColor'],
                          fontSize: dp(20),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Container(
                      height: dp(37),
                      padding: EdgeInsets.symmetric(horizontal: dp(29)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Настроение',
                            style: TextStyle(
                              color: AppColors.moodAssessmentPage['moodAssessorSecondaryTextColor'],
                              fontSize: dp(14),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            'Потяни',
                            style: TextStyle(
                              color: AppColors.moodAssessmentPage['moodAssessorSecondaryTextColor'],
                              fontSize: dp(14),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: dp(59),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  color: AppColors.moodAssessmentPage['moodColors']['4'],
                  width: dp(114),
                  height: dp(114),
                )
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildBottomButtons() {
    return           Container(
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
                fontWeight: FontWeight.w400,
              ),
            ),
            height: dp(60),
            minWidth: dp(150),
          ),
        ],
      ),
    );
  }
}