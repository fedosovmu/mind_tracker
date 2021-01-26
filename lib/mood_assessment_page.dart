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
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: dp(60)),
        child: Container(
          height: dp(300),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: dp(210),
                margin: EdgeInsets.symmetric(horizontal: dp(16)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                  color: AppColors.moodAssessmentPage['moodAssessorBackgroundColor'],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
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
                      alignment: Alignment.bottomCenter,
                      height: dp(40),
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
                    _buildMoodAssessorSlider()
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

  Widget _buildMoodAssessorSlider() {
    return Container(
      //color: Colors.green,
      height: dp(80),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: dp(26),
            child: Image.asset(
              'assets/images/mood_assessment/mood_slider.png',
              width: dp(270),
              color: AppColors.moodAssessmentPage['moodColors'][_currentMood],
            ),
          ),
          Positioned(
            top: dp(21),
            left: dp(16) + (_currentMood - 1) * dp(270 / 6),
            child: Container(
              width: dp(24),
              height: dp(24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Container(
                width: dp(13.33),
                height: dp(13.33),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.moodAssessmentPage['sliderCursorCenterColors'][_currentMood],
                ),
              ),
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: dp(13)),
            child: SliderTheme(
              data: SliderThemeData(
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 0,
                      disabledThumbRadius: 0,
                      pressedElevation: 0
                  ),
                  thumbColor: Color(0x00),
                  overlayColor: Color(0x00),
                  activeTrackColor: Color(0x00),
                  inactiveTrackColor: Color(0x00),
                  activeTickMarkColor: Color(0x00),
                  inactiveTickMarkColor: Color(0x00)
              ),
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
            ),
          ),
        ],
      )
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      height: dp(68),
      width: double.infinity,
      padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      child: FlatButton(
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
    );
  }
}
