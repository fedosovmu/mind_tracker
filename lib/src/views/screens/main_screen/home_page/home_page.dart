import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_sssessments_provider.dart';
import 'dart:async';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_colors.dart';
import 'package:provider/provider.dart';
import 'mood_assessment_card_list_view/mood_assessment_cards_list_view.dart';
import '../../../../business_logic/models/mood_assessment.dart';
import '../../../utils/theme/custom_text_styles.dart';


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


class AssessMoodButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () { print('Assess mood now button pressed'); },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/icons/plus_in_circle.png',
            width: dp(20),
          ),
          SizedBox(
            width: dp(10),
          ),
          Text(
            'Настроение сейчас',
            style: CustomTextStyles.basic
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      height: dp(51),
      color: CustomColors.main,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(dp(12)))
      ),
    );
  }

}