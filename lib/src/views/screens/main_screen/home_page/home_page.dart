import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/widgets/assess_mood_button.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Content {
  @override
  Widget build(BuildContext context) {
    loadContent('homePage');
    return Scaffold(
      appBar: CustomAppBar(
        title: content['title'],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Consumer<MoodAssessmentsProvider>(
              builder: (context, moodAssessmentsProvider, child) => MoodAssessmentCardsListView(
                moodAssessments: moodAssessmentsProvider.todayMoodAssessments,
              ),
            ),
          ),
          Positioned(
            left: dp(16),
            right: dp(16),
            bottom: dp(16),
              child: AssessMoodButton()
          ),
        ]
      )
    );
  }
}


