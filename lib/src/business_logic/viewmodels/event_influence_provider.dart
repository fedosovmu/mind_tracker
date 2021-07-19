import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/event_influence.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/mood_assessments_provider.dart';


class EventInfluenceProvider extends ChangeNotifier {
  MoodAssessmentsProvider _moodAssessmentsProvider;

  EventInfluenceProvider(MoodAssessmentsProvider moodAssessmentsProvider) {
    _moodAssessmentsProvider = moodAssessmentsProvider;
    _moodAssessmentsProvider.addListener(() async {
      notifyListeners();
    });
  }

  List<Event> _getUniqueUsedEventsForPeriod({@required DateTime startDate, @required DateTime endDate}) {
    final moodAssessmentsForPeriod = _moodAssessmentsProvider.getMoodAssessmentsForPeriod(
        startDate: startDate,
        endDate: endDate
    );
    final moodAssessmentWithEvents = moodAssessmentsForPeriod.where(
            (moodAssessment) => moodAssessment.events != null);
    final List<Event> uniqueEvents = [];
    moodAssessmentWithEvents.forEach((moodAssessment) {
      moodAssessment.events.forEach((event) {
        if (!uniqueEvents.contains(event)) {
          uniqueEvents.add(event);
        }
      });
    });
    return uniqueEvents;
  }

  EventInfluence _getEventInfluenceForPeriod({@required Event event, @required DateTime startDate, @required DateTime endDate}) {
    final moodAssessmentsForPeriod = _moodAssessmentsProvider.getMoodAssessmentsForPeriod(
        startDate: startDate,
        endDate: endDate
    ).toList();
    final moodAssessmentWithSelectedEvent = moodAssessmentsForPeriod.where(
            (moodAssessment) => moodAssessment.events != null).where(
            (moodAssessment) => moodAssessment.events.contains(event))
        .toList();
    final moodAssessmentsWithoutSelectedEvent = moodAssessmentsForPeriod.where(
            (moodAssessment) => !moodAssessmentWithSelectedEvent.contains(moodAssessment))
        .toList();
    if (moodAssessmentsWithoutSelectedEvent.isEmpty) {
      return EventInfluence.neutral;
    }
    final averageMoodWithSelectedEvent = _getAverageMood(moodAssessmentWithSelectedEvent);
    final averageMoodWithoutSelectedEvent = _getAverageMood(moodAssessmentsWithoutSelectedEvent);
    final moodDelta = averageMoodWithSelectedEvent - averageMoodWithoutSelectedEvent;
    print('[EVENT INFLUENCE] ${event.title} '
        'with: ${averageMoodWithSelectedEvent.toStringAsFixed(2)} '
        'without: ${averageMoodWithoutSelectedEvent.toStringAsFixed(2)} '
        'delta: ${moodDelta.toStringAsFixed(2)}');
    if (moodDelta <= 0.1 && moodDelta >= -0.1) {
      return EventInfluence.neutral;
    }
    if (moodDelta > 0) {
      if (moodDelta < 0.95) {
        return EventInfluence.up;
      }
      return EventInfluence.superUp;
    } else {
      if (moodDelta.abs() < 0.95) {
        return EventInfluence.down;
      }
      return EventInfluence.superDown;
    }
  }

  double _getAverageMood(List<MoodAssessment> moodAssessments) {
    int moodSum = 0;
    moodAssessments.forEach((moodAssessment) {
      moodSum += moodAssessment.mood;
    });
    final double averageMood = moodSum / moodAssessments.length;
    return averageMood;
  }

  Map<Event, EventInfluence> getEventInfluenceForPeriod({@required DateTime startDate, @required DateTime endDate}) {
    final List<Event> uniqueEvents = _getUniqueUsedEventsForPeriod(
      startDate: startDate,
      endDate: endDate
    );
    return Map.fromIterable(
      uniqueEvents,
      key: (event) => event,
      value: (event) => _getEventInfluenceForPeriod(
          event: event,
          startDate: startDate,
          endDate: endDate
      )
    );
  }
}