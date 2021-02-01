import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';
import '../../../../business_logic/services/database_provider.dart';
import '../../../utils/custom_text_styles.dart';


class HomePage extends StatelessWidget with Content {
  MoodAssessment _newMoodAssess;

  HomePage ({MoodAssessment newMoodAssess}) {
    _newMoodAssess = newMoodAssess;
  }

  @override
  Widget build(BuildContext context) {
    loadContent('homePage');
    return Scaffold(
      appBar: CustomAppBar(
        title: content['title'],
      ),
      body: FutureBuilder<List<MoodAssessment>>(
        future: DatabaseProvider.db.getMoodAssessments(),
        builder: (BuildContext context, AsyncSnapshot<List<MoodAssessment>> snapshot) {
          if (snapshot.hasData) {
            return MoodAssessmentCardsListView(moodAssessments: snapshot.data);
          } else {
            return SizedBox.expand();
          }
        },
      )
    );
  }
}
