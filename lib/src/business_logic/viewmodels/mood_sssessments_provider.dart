import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessments_for_day.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  final MoodAssessmentsForDay today;
  final List<MoodAssessment> todayMoodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.todayMoodAssessments, MoodAssessmentsForDay this.today});

  void addToday(MoodAssessment moodAssessment) {
    todayMoodAssessments.add(moodAssessment);
    notifyListeners();
  }

  void removeAll() {
    todayMoodAssessments.clear();
    notifyListeners();
  }
}