import 'package:flutter/widgets.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  final List<MoodAssessment> todayMoodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.todayMoodAssessments,});

  void addToday(MoodAssessment moodAssessment) {
    todayMoodAssessments.add(moodAssessment);
    notifyListeners();
  }

  void removeAll() {
    todayMoodAssessments.clear();
    notifyListeners();
  }
}