import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';
import '../models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  List<MoodAssessment> _moodAssessments;

  MoodAssessmentsProvider() {
    _initializeListeners();
  }

  void _initializeListeners() {
    FirebaseAuthProvider.authStateChanges.listen((uid) async {
      _moodAssessments = [];
      notifyListeners();
      if (uid != null) {
        _moodAssessments = await CloudFirestoreProvider.getAllMoodAssessmentsOfAuthorizedUser();
        notifyListeners();
      }
    });
  }

  List<MoodAssessment> getMoodAssessmentsForDate (DateTime date) {
    final List<MoodAssessment> moodAssessmentsForDate = _moodAssessments.where(
            (moodAssessment) => moodAssessment.date == date.date).toList();
    moodAssessmentsForDate.sort();
    return moodAssessmentsForDate;
  }

  List<MoodAssessment> getMoodAssessmentForPeriod ({@required DateTime startDate, @required DateTime endDate}) {
    final List<MoodAssessment> weekMoodAssessments = _moodAssessments.where((moodAssessment) {
      final DateTime date = moodAssessment.date;
      final bool isAfterOrAtTheSameTime = date.isAfter(startDate) || date == startDate;
      final bool isBeforeOrAtTheSameTime = date.isBefore(endDate) || date == endDate;
      return isAfterOrAtTheSameTime && isBeforeOrAtTheSameTime;
    }).toList();
    weekMoodAssessments.sort();
    return weekMoodAssessments;
  }

  void add(MoodAssessment moodAssessment) {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      _moodAssessments.add(moodAssessment);
      CloudFirestoreProvider.addMoodAssessment(moodAssessment);
      notifyListeners();
    }
  }
}