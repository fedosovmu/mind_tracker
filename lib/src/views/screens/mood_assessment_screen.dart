import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/main_screen.dart';
import '../utils/custom_text_styles.dart';
import '../utils/custom_colors.dart';
import '../utils/content.dart';
import '../utils/metrics.dart';
import '../common_widgets/custom_app_bar.dart';
import '../../business_logic/models/mood_assessment.dart';


class MoodAssessmentScreen extends StatefulWidget {
  var _showSkipButton;
  MoodAssessmentScreen({Key key, bool firstStart = false}) : super(key: key) {
    _showSkipButton = firstStart;
  }

  @override
  _MoodAssessmentScreenState createState() => _MoodAssessmentScreenState();
}

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> with Content {
  _MoodAssessmentScreenState() {
    loadContent('moodAssessmentScreen');
  }
  double _currentSliderValue = 4;
  int _currentMood = 4;

  void _goToNextScreen({MoodAssessment newMoodAssessment}) {
    Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (context, _, __) => newMoodAssessment != null ? MainScreen(
                todayMoodAssessments: [newMoodAssessment]
            ) : MainScreen(),
            transitionsBuilder: (___, animation, ____, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: content['titleText'],
        leading: IconButton(
          icon: Image.asset(
            content['pathToCloseIcon'],
            height: dp(32),
            width: dp(32),
          ),
          onPressed: () {print('Close'); },
        ),
      ),
      body: Container(
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
          height: dp(314),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: dp(210),
                margin: EdgeInsets.symmetric(horizontal: dp(16)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                  color: CustomColors.purpleSuperDark,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        content['moodNames'][_currentMood],
                        style: CustomTextStyles.titleH1,
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
                            content['secondaryMoodText'],
                            style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
                          ),
                          Text(
                            content['secondaryPullText'],
                            style: CustomTextStyles.basic.copyWith(color: CustomColors.purpleLight),
                          )
                        ],
                      ),
                    ),
                    _buildMoodAssessorSlider()
                  ],
                ),
              ),
              Positioned(
                top: 10,
                child: Image.asset(
                  content['pathsToMoodSpheres'][_currentMood],
                  height: dp(214),
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
      height: dp(80),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: dp(26),
            child: Image.asset(
              content['pathToMoodSliderImage'],
              width: dp(270),
              color: CustomColors.moods[_currentMood],
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
                  color: CustomColors.moods[_currentMood],
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
                      color = CustomColors.moods[_currentMood];
                    }
                    else {
                      color = CustomColors.purpleDark;
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
    if (widget._showSkipButton) {
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
          SizedBox(
            height: dp(60),
            width: double.infinity,
            child: FlatButton(
              onPressed: () {_goToNextScreen(newMoodAssessment: MoodAssessment(mood: _currentMood));},
              child: Text(
                content['assessButtonText'],
                style: CustomTextStyles.buttonMedium,
              ),
              color: CustomColors.moods[_currentMood],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(dp(16)))
              ),
            ),
          ),
          (widget._showSkipButton ? _buildSkipButton() : const SizedBox.shrink())
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return FlatButton(
      onPressed: () {_goToNextScreen();},
      child: Text(
        content['skipButtonText'],
        style: CustomTextStyles.buttonBasic.copyWith(
          color: Color(0xFFACA5BA)
        ),
      ),
      height: dp(60),
      minWidth: dp(150),
    );
  }
}
