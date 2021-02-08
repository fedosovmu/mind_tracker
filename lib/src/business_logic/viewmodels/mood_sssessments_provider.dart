import 'package:flutter/widgets.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  final List<MoodAssessment> moodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.moodAssessments});

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    notifyListeners();
  }

  void removeAll() {
    moodAssessments.clear();
    notifyListeners();
  }
}