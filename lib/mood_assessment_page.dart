import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_content.dart';
import 'metrics.dart';


class MoodAssessmentPage extends StatefulWidget {
  MoodAssessmentPage({Key key}) : super(key: key);

  @override
  _MoodAssessmentPageState createState() => _MoodAssessmentPageState();
}

class _MoodAssessmentPageState extends State<MoodAssessmentPage> {
  double _currentSliderValue = 4;
  int _currentMood = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppContent.moodAssessmentPage['headerText'],
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
        // Тестирую верстку на экранах разной высоты
        //height: dp(400),
        //height: dp(450),
        //height: dp(512),
        //height: dp(600),
        //height: dp(650),
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
          height: dp(300),
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
                        AppContent.moodAssessmentPage['moodNames'][_currentMood],
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
                            AppContent.moodAssessmentPage['secondaryMoodText'],
                            style: TextStyle(
                              color: AppColors.moodAssessmentPage['moodAssessorSecondaryTextColor'],
                              fontSize: dp(14),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            AppContent.moodAssessmentPage['secondaryPullText'],
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
                      height: dp(59),
                      padding: EdgeInsets.symmetric(horizontal: dp(3)),
                      child: Slider(
                        value: _currentSliderValue,
                        min: 1,
                        max: 7,
                        divisions: 6,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                            _currentMood = value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Image.asset(
                  AppContent.moodAssessmentPage['pathsToMoodSpheres'][_currentMood],
                  height: dp(200),
                )
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      height: dp(136),
      width: double.infinity,
      padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () {print('Assess Mood');},
            child: Text(
              AppContent.moodAssessmentPage['assessButtonText'],
              style: TextStyle(
                color: AppColors.moodAssessmentPage['assessMoodButtonTextColor'],
                fontSize: dp(18),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            color: AppColors.moodAssessmentPage['moodColors'][_currentMood],
            height: dp(60),
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(dp(16)))
            ),
          ),
          FlatButton(
            onPressed: () {print('Skip');},
            child: Text(
              AppContent.moodAssessmentPage['skipButtonText'],
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