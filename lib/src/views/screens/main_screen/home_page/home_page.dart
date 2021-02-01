import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';
import '../../../../business_logic/services/database_provider.dart';
import '../../../utils/custom_text_styles.dart';


class HomePage extends StatefulWidget {
  List<MoodAssessment> _moodAssessments = [];

  HomePage ({List<MoodAssessment> moodAssessments}) {
    _moodAssessments = moodAssessments;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Content {
  List<MoodAssessment> _moodAssessments;
  var _newMoodAseesmentNumber = 7;

  @override
  void initState() {
    super.initState();
    _moodAssessments = [...widget._moodAssessments];
    DatabaseProvider.db.getMoodAssessments().then((value) {
      print('LOADID');
      DatabaseProvider.db.getMoodAssessments().then((value) => _moodAssessments.add(value[0]));
      //_moodAssessments.add(MoodAssessment(id: 10, mood: 4));
    });
  }



  @override
  Widget build(BuildContext context) {
    loadContent('homePage');
    return Scaffold(
      appBar: CustomAppBar(
        title: content['title'],
      ),
      body: MoodAssessmentCardsListView(
        moodAssessments: _moodAssessments,
        emptyCardOnPressed: () {
            print('PRESS EMPTY');
            setState(() {
              _moodAssessments.add(MoodAssessment(id: _newMoodAseesmentNumber, mood: _newMoodAseesmentNumber));
              _newMoodAseesmentNumber = _newMoodAseesmentNumber == 1 ? 7 : _newMoodAseesmentNumber - 1;
            });
        },
      )
    );
  }
}
