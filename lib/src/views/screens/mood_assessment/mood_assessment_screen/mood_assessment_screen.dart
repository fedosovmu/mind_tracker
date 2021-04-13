import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/mood_assessor/mood_assessor.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/add_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/'
    'assess_mood_colored_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/edit_comment_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/edit_selected_events_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:provider/provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentScreen extends StatefulWidget {
  final bool firstStart;
  final Map arguments;

  MoodAssessmentScreen({this.firstStart = false, this.arguments});

  @override
  _MoodAssessmentScreenState createState() => _MoodAssessmentScreenState();
}

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> {
  static const _defaultMood = 4;
  int _currentMood = _defaultMood;
  String _comment;
  List<String> _selectedEventNames;
  @override
  void initState() {
    super.initState();
    _comment = '';
    _selectedEventNames = [];
  }
  
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
        return MoodAssessment(
          mood: _currentMood,
          events: _selectedEventNames,
          comment: _comment
        );
      } else {
        return MoodAssessment(
          mood: _currentMood,
          date: widget.arguments['date'],
          partOfDay: widget.arguments['partOfDay'],
          events: _selectedEventNames,
          comment: _comment
        );
      }
    } else {
      return MoodAssessment(mood: _currentMood, events: _selectedEventNames, comment: _comment);
    }
  }

  void _commentButtonCallback () async {
    print('Comment button pressed');
    final comment = await Navigator.of(context).pushNamed('/comment', arguments: _comment);
    print('=== COMMENT $comment');
    if (comment != null) {
      setState(() {
        _comment = comment;
      });
    }
  }

  void _selectEventsButtonCallback () async {
    print('Event button pressed');
    final selectedEventNames = await Navigator.of(context)
        .pushNamed('/selectEvents', arguments: _selectedEventNames);
    print('=== SELECTED EVENTS $selectedEventNames');
    if (selectedEventNames != null) {
      setState(() {
        _selectedEventNames = selectedEventNames;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false, //TODO: Проверить что все работает на IOS
      appBar: CustomAppBar(
        title: _getTitle(context),
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.close,
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
                        _selectedEventNames.isEmpty ? AddButton(
                          'Событие', onPressed: _selectEventsButtonCallback,
                        ) : EditSelectedEventsButton(
                            eventsCount: _selectedEventNames.length,
                            onPressed: _selectEventsButtonCallback
                        ),
                        _comment.isEmpty ? AddButton(
                          'Комментарий',
                          onPressed: _commentButtonCallback,
                        ) : EditCommentButton(
                            onPressed: _commentButtonCallback
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