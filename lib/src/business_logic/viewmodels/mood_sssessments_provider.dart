import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/database_provider.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  final List<MoodAssessment> moodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.moodAssessments});

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    DatabaseProvider.db.insertMoodAssessment(moodAssessment);
    notifyListeners();
  }

  void removeAll() {
    moodAssessments.clear();
    DatabaseProvider.db.deleteAllMoodAssessments();
    notifyListeners();
  }
}