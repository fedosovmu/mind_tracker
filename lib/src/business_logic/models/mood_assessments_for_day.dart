import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


class MoodAssessmentsForDay {
  DateTime date;
  List<MoodAssessment> moodAssessments;

  MoodAssessmentsForDay({this.date, this.moodAssessments});
}