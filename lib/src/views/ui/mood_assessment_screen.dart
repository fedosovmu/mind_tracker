import 'package:flutter/material.dart';
import '../utils/screen_data.dart';
import '../utils/app_text_styles.dart';
import '../utils/app_colors.dart';
import '../utils/app_content.dart';
import '../utils/metrics.dart';


class MoodAssessmentScreen extends StatefulWidget {
  var _showSkipButton;
  MoodAssessmentScreen({Key key, bool showSkipButton}) : super(key: key) {
    _showSkipButton = showSkipButton;
  }

  @override
  _MoodAssessmentScreenState createState() => _MoodAssessmentScreenState(_showSkipButton);
}

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> with ScreenData {
  _MoodAssessmentScreenState(showSkipButton) {
    _showSkipButton = showSkipButton;
    setScreenData('moodAssessmentScreen');
  }
  bool _showSkipButton;
  double _currentSliderValue = 4;
  int _currentMood = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          content['headerText'],
          style: textStyles['title'],
        ),
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: dp(56),
        leading: IconButton(
          icon: Image.asset(
            content['pathToCloseIcon'],
            height: dp(32),
            width: dp(32),
          ),
          onPressed: () {print('Close'); },
        ),
        //IconButton(),
        leadingWidth: dp(56),
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
          height: dp(300),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: dp(210),
                margin: EdgeInsets.symmetric(horizontal: dp(16)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(dp(16))),
                  color: colors['moodAssessorBackground'],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        content['moodNames'][_currentMood],
                        style: textStyles['moodAssessorMood'],
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
                            style: textStyles['moodAssessorSecondary'],
                          ),
                          Text(
                            content['secondaryPullText'],
                            style: textStyles['moodAssessorSecondary'],
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
                  content['pathsToMoodSpheres'][_currentMood],
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
      height: dp(80),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: dp(26),
            child: Image.asset(
              content['pathToMoodSliderImage'],
              width: dp(270),
              color: colors['moods'][_currentMood],
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
                  color: colors['sliderCursor'][_currentMood],
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
                      color = colors['sliderCursor'][_currentMood];
                    }
                    else {
                      color = colors['sliderScaleNeutral'];
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
          SizedBox(
            height: dp(60),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {print('Assess Mood $_currentMood');},
              child: Text(
                content['assessButtonText'],
                style: textStyles['assessMoodButton'],
              ),
              color: colors['moods'][_currentMood],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(dp(16)))
              ),
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
        content['skipButtonText'],
        style: textStyles['skipButton'],
      ),
      height: dp(60),
      minWidth: dp(150),
    );
  }
}
