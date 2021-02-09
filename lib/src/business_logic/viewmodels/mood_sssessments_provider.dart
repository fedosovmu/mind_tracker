import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_provider.dart';
import '../models/mood_assessment.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  List<MoodAssessment> moodAssessments;

  MoodAssessmentsProvider({List<MoodAssessment> this.moodAssessments,});

  List<MoodAssessment> get todayMoodAssessments {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return moodAssessments.where((moodAssessment) => moodAssessment.date == today).toList();
  }

  void add(MoodAssessment moodAssessment) {
    todayMoodAssessments.add(moodAssessment);
    FirebaseProvider.addMoodAssessment(moodAssessment);
    notifyListeners();
  }
}