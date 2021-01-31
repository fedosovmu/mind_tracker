import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assess.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'mood_assessment_card.dart';
import 'empty_mood_assessment_card.dart';


class MoodAssessmentCardsListView extends StatelessWidget {
  MoodAssess _moodAssess;

  MoodAssessmentCardsListView (moodAssess) {
    _moodAssess = moodAssess;
  }

  @override
  Widget build(BuildContext context) {
    var moodAssessmentCards = [];
    if (_moodAssess != null) {
      moodAssessmentCards = List.generate(1, (index) =>
          MoodAssessmentCard(_moodAssess)
      );
    }

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
                EmptyMoodAssessmentCard()
              ],
            ),
            ...moodSpheres,
          ]
      ),
    );
  }
}