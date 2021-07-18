import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/models/event_influence.dart';
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

  Map<Event, EventInfluence> getEventInfluenceForPeriod({@required DateTime startDate, @required DateTime endDate}) {
    return {};
  }
}