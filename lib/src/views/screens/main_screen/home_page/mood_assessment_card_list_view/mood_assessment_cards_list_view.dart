import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'mood_assessment_card.dart';
import 'mood_assessment_empty_card.dart';


class MoodAssessmentCardsListView extends StatelessWidget {
  final List<MoodAssessment> moodAssessments;

  MoodAssessmentCardsListView ({this.moodAssessments = const []});

  @override
  Widget build(BuildContext context) {
    var moodAssessmentCards = List.generate(moodAssessments.length, (index) =>
          MoodAssessmentCard(moodAssessments[index])
      );


    final moodSpheres = List.generate(moodAssessmentCards.length, (index) {
      var mood = moodAssessmentCards[index].moodAssess.mood;
      if (mood != null) {
        return Positioned(
            top: dp(dp(-5) + index * dp(136)),
            left: dp(160),
            child: Image.asset(
              'assets/images/common/mood_spheres/$mood.png',
              scale: dp(2),
            )
        );
      }
    });

    return SingleChildScrollView(
      child: Stack(
          children:[
            Column(
              children: [
                ...moodAssessmentCards,
                MoodAssessmentEmptyCard()
              ],
            ),
            ...moodSpheres,
          ]
      ),
    );
  }
}