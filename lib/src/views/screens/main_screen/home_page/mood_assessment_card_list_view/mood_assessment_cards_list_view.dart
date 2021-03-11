import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
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
      var mood = moodAssessmentCards[index].moodAssessment.mood;
      if (mood != null) {
        return Positioned(
            top: dp(-5) + index * dp(136+8),
            right: dp(-20),
            child: Image.asset(
              'assets/images/common/mood_spheres/$mood.png',
              width: dp(220),
            )
        );
      }
    });

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
      },
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
            children:[
              Column(
                children: [
                  ...moodAssessmentCards,
                  MoodAssessmentEmptyCard(PartOfDay.evening),
                  SizedBox(height: dp(51+16))
                ],
              ),
              ...moodSpheres,
            ]
        ),
      ),
    );
  }
}