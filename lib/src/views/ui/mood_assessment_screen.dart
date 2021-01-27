import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_content.dart';
import '../utils/metrics.dart';


class MoodAssessmentScreen extends StatefulWidget {
  MoodAssessmentScreen({Key key, bool showSkipButton}) : super(key: key) {
    _showSkipButton = showSkipButton;
  }

  var _showSkipButton;

  @override
  _MoodAssessmentScreenState createState() => _MoodAssessmentScreenState(_showSkipButton);
}

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> {
  _MoodAssessmentScreenState(showSkipButton) {
    _showSkipButton = showSkipButton;
  }
  bool _showSkipButton;
  double _currentSliderValue = 4;
  int _currentMood = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppContent.moodAssessmentScreen['headerText'],
          style: TextStyle(
            fontSize: dp(20),
            color: AppColors.moodAssessmentScreen['appBarTextColor'],
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: dp(56),
        leading: IconButton(
          icon: Image.asset(
            AppContent.moodAssessmentScreen['pathToCloseIcon'],
            height: dp(32),
            width: dp(32),
          ),
          onPressed: () {print('Close'); },
        ),
        //IconButton(),
        leadingWidth: dp(56),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildMoodAssessor(),
              _buildBottomButtons(),
            ],
          ),
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
                  color: AppColors.moodAssessmentScreen['moodAssessorBackgroundColor'],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        AppContent.moodAssessmentScreen['moodNames'][_currentMood],
                        style: TextStyle(
                          color: AppColors.moodAssessmentScreen['moodAssessorMoodTextColor'],
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
                            AppContent.moodAssessmentScreen['secondaryMoodText'],
                            style: TextStyle(
                              color: AppColors.moodAssessmentScreen['moodAssessorSecondaryTextColor'],
                              fontSize: dp(14),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Text(
                            AppContent.moodAssessmentScreen['secondaryPullText'],
                            style: TextStyle(
                              color: AppColors.moodAssessmentScreen['moodAssessorSecondaryTextColor'],
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
                  AppContent.moodAssessmentScreen['pathsToMoodSpheres'][_currentMood],
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
              AppContent.moodAssessmentScreen['pathToMoodSliderImage'],
              width: dp(270),
              color: AppColors.moodAssessmentScreen['moodColors'][_currentMood],
            ),
          ),
          Positioned(
            top: dp(21),
            left: dp(22) + (_currentMood - 1) * dp(43),
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
                  color: AppColors.moodAssessmentScreen['sliderCursorColors'][_currentMood],
                ),
              ),
            )
          ),
          Positioned(
            bottom: dp(13),
              child: Container(
                width: dp(258),
                height: dp(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    var color;
                    if (index + 1 == _currentMood) {
                      color = AppColors.moodAssessmentScreen['sliderCursorColors'][_currentMood];
                    }
                    else {
                      color = AppColors.moodAssessmentScreen['sliderScaleNeutralColor'];
                    }
                    return Container(
                      color: color,
                      width: dp(2),
                      height: dp(16),
                    );
                  }),
                )
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
                  thumbColor: const Color(0x00),
                  overlayColor: const Color(0x00),
                  activeTrackColor: const Color(0x00),
                  inactiveTrackColor: const Color(0x00),
                  activeTickMarkColor: const Color(0x00),
                  inactiveTickMarkColor: const Color(0x00)
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
    var buttonsHeight;
    if (_showSkipButton) {
      buttonsHeight = dp(136);
    }
    else {
      buttonsHeight = dp(68);
    }
    return Container(
      height: buttonsHeight,
      width: double.infinity,
      padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () {print('Assess Mood');},
            child: Text(
              AppContent.moodAssessmentScreen['assessButtonText'],
              style: TextStyle(
                color: AppColors.moodAssessmentScreen['assessMoodButtonTextColor'],
                fontSize: dp(18),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            color: AppColors.moodAssessmentScreen['moodColors'][_currentMood],
            height: dp(60),
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(dp(16)))
            ),
          ),
          (_showSkipButton ? _buildSkipButton() : const SizedBox.shrink())
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return FlatButton(
      onPressed: () {print('Skip');},
      child: Text(
        AppContent.moodAssessmentScreen['skipButtonText'],
        style: TextStyle(
          color: AppColors.moodAssessmentScreen['skipButtonTextColor'],
          fontSize: dp(18),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      height: dp(60),
      minWidth: dp(150),
    );
  }
}
