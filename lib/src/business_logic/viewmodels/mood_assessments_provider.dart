import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';
import '../models/mood_assessment.dart';
import 'package:mind_tracker/src/business_logic/services/date_time_and_string_extensions.dart';


class MoodAssessmentsProvider extends ChangeNotifier {
  List<MoodAssessment> _moodAssessments = [];

  Future<void> loadData() async {
    _moodAssessments = await CloudFirestoreProvider.getAllMoodAssessmentsOfAuthorizedUser();
    notifyListeners();
    return;
  }

  List<MoodAssessment> getMoodAssessmentsForDate (DateTime date) {
    final List<MoodAssessment> moodAssessmentsForDate = _moodAssessments.where(
            (moodAssessment) => moodAssessment.date == date.date).toList();
    moodAssessmentsForDate.sort();
    return moodAssessmentsForDate;
  }

  List<MoodAssessment> getMoodAssessmentsForPeriod ({@required DateTime startDate, @required DateTime endDate}) {
    final List<MoodAssessment> moodAssessmentsForPeriod = _moodAssessments.where((moodAssessment) {
      final DateTime date = moodAssessment.date;
      final bool isAfterOrAtTheSameTime = date.isAfter(startDate) || date == startDate;
      final bool isBeforeOrAtTheSameTime = date.isBefore(endDate) || date == endDate;
      return isAfterOrAtTheSameTime && isBeforeOrAtTheSameTime;
    }).toList();
    moodAssessmentsForPeriod.sort();
    return moodAssessmentsForPeriod;
  }

  void add(MoodAssessment moodAssessment) async {
    _moodAssessments.add(moodAssessment);
    notifyListeners();
    final docId = await CloudFirestoreProvider.createMoodAssessment(moodAssessment);
    moodAssessment.docId = docId;
    print('[MOOD ASSESSMENT PROVIDER] Mood assessment id updated $moodAssessment');
    notifyListeners();
  }

  void update(MoodAssessment updatedMoodAssessment) {
    _moodAssessments.removeWhere((moodAssessment) => moodAssessment.docId == updatedMoodAssessment.docId);
    _moodAssessments.add(updatedMoodAssessment);
    CloudFirestoreProvider.updateMoodAssessment(updatedMoodAssessment, updatedMoodAssessment.docId);
    notifyListeners();
  }

  void delete(MoodAssessment moodAssessmentForDelete) {
    _moodAssessments.removeWhere((moodAssessment) => moodAssessment.docId == moodAssessmentForDelete.docId);
    CloudFirestoreProvider.deleteMoodAssessment(moodAssessmentForDelete);
    notifyListeners();
  }
}