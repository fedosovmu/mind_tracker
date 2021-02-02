import 'package:flutter/widgets.dart';
import 'mood_assessment.dart';


class TodayMoodAssessments extends ChangeNotifier {
  final List<MoodAssessment> moodAssessments;

  TodayMoodAssessments({List<MoodAssessment> this.moodAssessments});

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    notifyListeners();
  }

  void removeAll() {
    moodAssessments.clear();
    notifyListeners();
  }
}