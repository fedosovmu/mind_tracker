import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


class MoodAssessmentsForDay {
  final DateTime date;
  final List<MoodAssessment> moodAssessments;
  Function onChanged;

  MoodAssessmentsForDay(this.date, this.moodAssessments, this.onChanged);

  void add(MoodAssessment moodAssessment) {
    moodAssessments.add(moodAssessment);
    onChanged(this);
  }
}