import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/widgets/assess_mood_now_button.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
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
        rightLeading: CustomLeading(
          iconSize: dp(24),
          pathToIcon: CustomIconPaths.settings,
          onPressed: () {
            print('Settings button pressed');
          },
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            GlowDisabler(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: MoodAssessmentCardsListView(today)
              )
            ),
            Positioned(
              left: dp(16),
              right: dp(16),
              bottom: dp(16),
                child: AssessMoodNowButton()
            ),
          ]
        ),
      )
    );
  }
}


