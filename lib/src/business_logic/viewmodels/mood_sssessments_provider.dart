import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_provider.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  final List<MoodAssessment> todayMoodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.todayMoodAssessments,});

  void add(MoodAssessment moodAssessment) {
    todayMoodAssessments.add(moodAssessment);
    FirebaseProvider.addMoodAssessment(moodAssessment);
    notifyListeners();
  }
}