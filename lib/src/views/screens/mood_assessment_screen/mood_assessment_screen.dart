import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment_screen/mood_assessor/mood_assessor.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment_screen/widgets/assess_mood_colored_button.dart';
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

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> {
  static const _pathToCloseIcon = 'assets/icons/close.png';
  static const _defaultMood = 4;
  int _currentMood = _defaultMood;

  void _goToHomeScreen() {
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
        title: 'Как ваше настроение?',
        leading: IconButton(
          icon: Image.asset(
            _pathToCloseIcon,
            height: dp(32),
            width: dp(32),
          ),
          onPressed: () {
            print('Press close button');
            _goToHomeScreen();
          },
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(bottom: dp(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MoodAssessor(
              currentMood: _currentMood,
              onChanged: (double value) {
                setState(() {
                  _currentMood = value.toInt();
                });
              },
            ),
            AssessMoodColoredButton(
              currentMood: _currentMood,
              onPressed: () {
                Provider.of<MoodAssessmentsProvider>(context, listen: false).add(MoodAssessment(mood: _currentMood));
                _goToHomeScreen();
              },
            )
          ],
        ),
      ),
    );
  }
}