import 'package:flutter/cupertino.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';


class HomePage extends StatelessWidget {
  MoodAssessment _newMoodAssess;

  HomePage ({MoodAssessment moodAssess}) {
    _newMoodAssess = moodAssess;
  }

  @override
  Widget build(BuildContext context) {
    return MoodAssessmentCardsListView(_newMoodAssess);
  }
}
