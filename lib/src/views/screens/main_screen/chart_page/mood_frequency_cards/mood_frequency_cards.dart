import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/views/screens/main_screen/chart_page/mood_frequency_cards/mood_frequency_card.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class MoodFrequencyCards extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  MoodFrequencyCards({@required this.startDate, @required this.endDate});

  List<Widget> _getMoodFrequencyCards() {
    final List<Widget> moodFrequencyCards = [];
    final partOfDayCount = PartOfDay.values.length;
    for (int i = 0; i <= partOfDayCount; i++) {
      final partOfDay = PartOfDay.values[(i + 1) % partOfDayCount];
      final card = MoodFrequencyCard(
        mood: i+3,
        partOfDay: partOfDay,
        moodAssessmentsWithSameMoodCount: 3+i*3,
        moodAssessmentsAllCount: 10+i,
      );
      moodFrequencyCards.add(card);
    }
    return moodFrequencyCards;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dp(16), vertical: dp(8)),
      height: MoodFrequencyCard.height * 2 + dp(8*3),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: dp(8),
        mainAxisSpacing: dp(8),
        crossAxisCount: 2,
        childAspectRatio: MoodFrequencyCard.width / MoodFrequencyCard.height,
        children: _getMoodFrequencyCards(),
      ),
    );
  }
}