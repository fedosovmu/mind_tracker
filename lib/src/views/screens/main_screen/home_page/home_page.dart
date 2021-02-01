import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';


class HomePage extends StatelessWidget {
  MoodAssessment _newMoodAssess;

  HomePage ({MoodAssessment newMoodAssess}) {
    _newMoodAssess = newMoodAssess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ваше настроение',
      ),
      body: MoodAssessmentCardsListView(_newMoodAssess),
    );
  }
}
