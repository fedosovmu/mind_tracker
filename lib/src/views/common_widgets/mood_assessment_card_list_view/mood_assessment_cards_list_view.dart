import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/models/part_of_day.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/widgets/mood_sphere.dart';
import 'package:mind_tracker/src/views/common_widgets/mood_assessment_card_list_view/widgets/pressable_card.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';
import 'widgets/mood_assessment_card.dart';
import 'widgets/mood_assessment_empty_card.dart';


class MoodAssessmentCardsListView extends StatefulWidget {
  final DateTime dateForDisplayedMoodAssessments;
  bool _isToday;
  bool _isFuture;
  PartOfDay _currentPartOfDay;

  MoodAssessmentCardsListView(this.dateForDisplayedMoodAssessments) {
    final now = DateTime.now();
    _currentPartOfDay = PartOfDayBuilder.fromDateTime(now);
    final today = now.date;
    _isToday = (dateForDisplayedMoodAssessments == today);
    _isFuture = (dateForDisplayedMoodAssessments.isAfter(today));
  }

  @override
  _MoodAssessmentCardsListViewState createState() => _MoodAssessmentCardsListViewState();
}

class _MoodAssessmentCardsListViewState extends State<MoodAssessmentCardsListView> with TickerProviderStateMixin {

  Widget _createMoodAssessmentCardWithPressAnimation(MoodAssessment moodAssessment, AnimationController animationController) {
    return PressableCard(
      animationController: animationController,
      onPressed: () {
        print('PRESS CARD $moodAssessment');
        if (moodAssessment.isSavedToCloudFirestore()) {
          Navigator.pushNamed(context, '/moodAssessment',
              arguments: {'startMode': 'update', 'moodAssessment': moodAssessment});
        } else {
          print('[ERROR] Mood assessment not saved to cloud firestore');
        }
      },
      child: MoodAssessmentCard(moodAssessment)
    );
  }
  
  Widget _createMoodAssessmentEmptyCardWithPressAnimation({@required Function onPressed, @required Widget child}) {
    final animation = _createAnimationController();
    return PressableCard(
      animationController: animation,
      onPressed: onPressed,
      child: child,
    );
  }

  AnimationController _createAnimationController() {
    final animation = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100)
    );
    animation.value = 0;
    return animation;
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<MoodAssessmentsProvider>(
        builder: (context, moodAssessmentsProvider, child) {
          final moodAssessmentsForDay = moodAssessmentsProvider.getMoodAssessmentsForDate(widget.dateForDisplayedMoodAssessments);

          List<Widget> moodAssessmentCards = [];
          List<Widget> moodSpheres = [];
          var cardIndex = 0;
          for (var partOfDay in PartOfDay.values) {
            final moodAssessmentsForPartOfDay = moodAssessmentsForDay.where(
                    (moodAssessment) => moodAssessment.partOfDay == partOfDay).toList();
            if (moodAssessmentsForPartOfDay.isNotEmpty) {
              for (var moodAssessment in moodAssessmentsForPartOfDay) {
                final animation = _createAnimationController();
                final card = _createMoodAssessmentCardWithPressAnimation(moodAssessment, animation);
                moodAssessmentCards.add(card);
                final moodSphere = MoodSphere(cardIndex: cardIndex++, mood: moodAssessment.mood, animationController: animation);
                moodSpheres.add(moodSphere);
              }
            } else {
              const partOfDaysInWhichMayBeEmptyCards = {PartOfDay.morning, PartOfDay.day, PartOfDay.evening};
              final isMayContainEmptyCard = partOfDaysInWhichMayBeEmptyCards.contains(partOfDay);
              final isTimeToShow = (!widget._isFuture && !widget._isToday) || (widget._isToday && partOfDay.index <= widget._currentPartOfDay.index);
              final isTodayAndNight = widget._isToday && partOfDay == PartOfDay.night && widget._currentPartOfDay == PartOfDay.night;
              if ((isMayContainEmptyCard && isTimeToShow) || isTodayAndNight) {
                final missedDate = widget.dateForDisplayedMoodAssessments;
                final missedPartOfDay = partOfDay;
                final isTodayAndCurrentPartOfDay = widget._isToday && partOfDay.index == widget._currentPartOfDay.index;
                final onPressed = () {
                  print('PRESS EMPTY CARD ${missedDate.toStringDate()}, ${missedPartOfDay.toShortString()}');
                  if (isTodayAndCurrentPartOfDay) {
                    Navigator.pushNamed(context, '/moodAssessment',
                        arguments: {'startMode': 'now'});
                  } else {
                    Navigator.pushNamed(context, '/moodAssessment',
                        arguments: {'startMode': 'partOfDay', 'date': missedDate, 'partOfDay': missedPartOfDay});
                  }
                };
                final emptyCard = MoodAssessmentEmptyCard(missedDate, missedPartOfDay);
                final pressableEmptyCard = _createMoodAssessmentEmptyCardWithPressAnimation(
                  onPressed: onPressed,
                  child: emptyCard
                );
                moodAssessmentCards.add(pressableEmptyCard);
                cardIndex++;
              }
            }
          }
          final emptySpace = SizedBox(height: dp(48+16));
          moodAssessmentCards.add(emptySpace);

          return Stack(
            children: [
              Column(
                children: moodAssessmentCards,
              ),
              ...moodSpheres,
            ]
          );
        }
    );
  }
}