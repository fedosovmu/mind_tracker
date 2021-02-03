import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'dart:async';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:provider/provider.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';
import '../../../../business_logic/services/database_provider.dart';
import '../../../utils/theme/custom_text_styles.dart';


class HomePage extends StatefulWidget {
  List<MoodAssessment> _moodAssessments = [];

  HomePage ({List<MoodAssessment> moodAssessments}) {
    _moodAssessments.addAll(moodAssessments);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Content {
  List<MoodAssessment> _moodAssessments = [];
  var _newMoodAseesmentNumber = 7;

  @override
  Widget build(BuildContext context) {
    loadContent('homePage');
    return Scaffold(
      appBar: CustomAppBar(
        title: content['title'],
      ),
      body: Consumer<MoodAssessmentsProvider>(
        builder: (context, todayMoodAssessments, child) => MoodAssessmentCardsListView(
          moodAssessments: todayMoodAssessments.moodAssessments,
        ),
      )
    );
  }
}
