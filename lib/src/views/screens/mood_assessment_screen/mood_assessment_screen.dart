import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment_screen/mood_assessor/mood_assessor.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment_screen/widgets/add_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment_screen/widgets/assess_mood_colored_button.dart';
import 'package:provider/provider.dart';
import '../../utils/theme/custom_text_styles.dart';
import '../../utils/theme/custom_colors.dart';
import '../../utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import '../../common_widgets/custom_app_bar.dart';
import '../../../business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentScreen extends StatefulWidget {
  final bool firstStart;
  final Map arguments;

  MoodAssessmentScreen({this.firstStart = false, this.arguments});

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

  String _getDateWord (DateTime date) {
    return '${date.day} ${Content.monthNamesInParentCase[date.month]}';
  }

  String _getTitle (BuildContext context) {
    if (widget.arguments != null) {
      final now = DateTime.now();
      final today = now.date;
      final DateTime date = widget.arguments['date'];
      final PartOfDay partOfDay = widget.arguments['partOfDay'];
      final partOfDayWord = Content.partOfDayNames[partOfDay];

      if (date == today) {
        return 'Настроение за $partOfDayWord';
      } else {
        return '${_getDateWord(date)}, $partOfDayWord';
      }
    } else {
      return 'Как настроение?';
    }
  }

  MoodAssessment _createMoodAssessment(BuildContext context){
    if (widget.arguments != null) {
      final now = DateTime.now();
      final today = now.date;
      final PartOfDay currentPartOfDay = PartOfDayBuilder.fromDateTime(now);
      final DateTime date = widget.arguments['date'];
      final PartOfDay partOfDay = widget.arguments['partOfDay'];

      if (date == today && partOfDay == currentPartOfDay) {
        return MoodAssessment(mood: _currentMood);
      } else {
        return MoodAssessment(
            mood: _currentMood,
            date: widget.arguments['date'],
            partOfDay: widget.arguments['partOfDay']
        );
      }
    } else {
      return MoodAssessment(mood: _currentMood);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _getTitle(context),
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MoodAssessor(
                    currentMood: _currentMood,
                    onChanged: (double value) {
                      setState(() {
                        _currentMood = value.toInt();
                      });
                    },
                  ),
                  SizedBox(height: dp(16)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dp(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddButton(
                          'Событие',
                          onPressed: () { print('Event button pressed'); },
                        ),
                        AddButton(
                            'Комментарий',
                          onPressed: () { print('Comment button pressed'); },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            AssessMoodColoredButton(
              currentMood: _currentMood,
              onPressed: () {
                Provider.of<MoodAssessmentsProvider>(context, listen: false).add(
                    _createMoodAssessment(context)
                );
                _goToHomeScreen();
              },
            )
          ],
        ),
      ),
    );
  }
}