import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/mood_assessor/mood_assessor.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/add_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/edit_note_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/mood_assessment_screen/widgets/edit_selected_events_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:provider/provider.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentScreen extends StatefulWidget {
  final Map arguments;

  MoodAssessmentScreen({this.arguments});

  @override
  _MoodAssessmentScreenState createState() => _MoodAssessmentScreenState();
}

class _MoodAssessmentScreenState extends State<MoodAssessmentScreen> {
  static const _defaultMood = 4;
  int _currentMood = _defaultMood;
  String _note;
  List<Event> _selectedEvents;
  @override
  void initState() {
    super.initState();
    _note = '';
    _selectedEvents = [];
  }
  
  void _goToHomeScreen() {
    Navigator.pop(context);
  }

  String _getDateWord (DateTime date) {
    return '${date.day} ${Content.monthNamesInParentCase[date.month]}';
  }

  String _getTitle (BuildContext context) {
    switch (widget.arguments['startMode']) {
      case 'now':
        return 'Как настроение?';
      case 'partOfDay':
        final DateTime date = widget.arguments['date'];
        final PartOfDay partOfDay = widget.arguments['partOfDay'];
        final partOfDayWord = Content.partOfDayNames[partOfDay];

        final isToday = DateTime.now().date == date;
        if (isToday) {
          return 'Настроение за $partOfDayWord';
        }
        return '${_getDateWord(date)}, $partOfDayWord';
      case 'update':
        return 'Переоценка';
    }
  }

  void _assessMood() {
    switch (widget.arguments['startMode']) {
      case 'now':
      case 'partOfDay':
        Provider.of<MoodAssessmentsProvider>(context, listen: false).add(
            _createMoodAssessment(context)
        );
        break;
      case 'update':
        print('UPDATED');
        break;
    }
  }

  MoodAssessment _createMoodAssessment(BuildContext context){
    switch (widget.arguments['startMode']) {
      case 'now':
        return MoodAssessment(mood: _currentMood, events: _selectedEvents, note: _note);
      case 'partOfDay':
        return MoodAssessment(
            mood: _currentMood,
            date: widget.arguments['date'],
            partOfDay: widget.arguments['partOfDay'],
            events: _selectedEvents,
            note: _note
        );
    }
  }

  void _noteButtonCallback () async {
    print('Note button pressed');
    final note = await Navigator.of(context).pushNamed('/note', arguments: _note);
    print('ADD NOTE $note');
    if (note != null) {
      setState(() {
        _note = note;
      });
    }
  }

  void _selectEventsButtonCallback () async {
    print('Events button pressed');
    final selectedEvents = await Navigator.of(context)
        .pushNamed('/selectEvents', arguments: _selectedEvents);
    print('SELECT EVENTS $selectedEvents');
    if (selectedEvents != null) {
      setState(() {
        _selectedEvents = selectedEvents;
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
        minimum: EdgeInsets.only(bottom: dp(16)),
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
                        _selectedEvents.isEmpty ? AddButton(
                          'Событие', onPressed: _selectEventsButtonCallback,
                        ) : EditSelectedEventsButton(
                            eventsCount: _selectedEvents.length,
                            onPressed: _selectEventsButtonCallback
                        ),
                        _note.isEmpty ? AddButton(
                          'Заметка',
                          onPressed: _noteButtonCallback,
                        ) : EditNoteButton(
                            onPressed: _noteButtonCallback
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: dp(16)),
              child: StandardButton(
                title: 'Оценить',
                backgroundColor: CustomColors.moods[_currentMood],
                onPressed: () {
                  _assessMood();
                  _goToHomeScreen();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}