import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/theme/custom_text_styles.dart';
import '../../utils/theme/custom_colors.dart';
import '../../utils/content.dart';
import '../../utils/metrics.dart';
import '../../common_widgets/custom_app_bar.dart';
import '../../../business_logic/models/mood_assessment.dart';


class MoodAssessmentScreen extends StatefulWidget {
  final firstStart;
  MoodAssessmentScreen({Key key, bool this.firstStart = false});

  @override
  _MoodAssessmentScreenState createState() => _MoodAssessmentScreenState();
}

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> with Content {
  _MoodAssessmentScreenState() {
    loadContent('moodAssessmentScreen');
  }
  double _currentSliderValue = 4;
  int _currentMood = 4;

  void _goToNextScreen() {
    if (widget.firstStart) {
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } else {
      Navigator.pop(context); 
    }
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
          onPressed: () {
            print('Close');
            _goToNextScreen();
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildMoodAssessor(),
            _buildBottomButton(),
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

  Widget _buildBottomButton() {
    return Container(
      height: dp(68),
      width: double.infinity,
      padding: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(8)),
      child: SizedBox(
        height: dp(60),
        width: double.infinity,
        child: FlatButton(
          onPressed: () {
            Provider.of<MoodAssessmentsProvider>(context, listen: false).add(MoodAssessment(mood: _currentMood));
            _goToNextScreen();
          },
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
    );
  }
}
