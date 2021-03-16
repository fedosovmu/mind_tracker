import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import 'package:mind_tracker/src/views/common_widgets/single_child_scroll_view_without_splash.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/widgets/assess_mood_now_button.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().date;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Твоё настроение',
      ),
      body: Stack(
        children: [
          SingleChildScrollViewWithoutSplash(
              child: Column(
                children: [
                  MoodAssessmentCardsListView(today),
                  SizedBox(height: dp(51+16)) // Add padding for button
                ],
              )
          ),
          Positioned(
            left: dp(16),
            right: dp(16),
            bottom: dp(16),
              child: AssessMoodNowButton()
          ),
        ]
      )
    );
  }
}


