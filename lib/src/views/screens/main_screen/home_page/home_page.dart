import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';
import '../../../../business_logic/services/database_provider.dart';
import '../../../utils/custom_text_styles.dart';


class HomePage extends StatefulWidget {
  List<MoodAssessment> _moodAssessments;

  HomePage ({List<MoodAssessment> moodAssessments = const []}) {
    _moodAssessments = moodAssessments;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Content {
  List<MoodAssessment> _moodAssessments = [];

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
              _moodAssessments.add(MoodAssessment(id: 2, mood: 7));
            });
        },
      )
    );
  }
}
