import 'database_provider.dart';
import '../models/today_mood_sssessments.dart';
import 'dart:async';


abstract class InitialAppDataLoader {
  static Future<TodayMoodAssessments> loadTodayMoodAssessments () async {
    final moodAssessments = await DatabaseProvider.db.getMoodAssessments();
    final todayMoodAssessments = TodayMoodAssessments(
        moodAssessments: moodAssessments
    );
    print('INITIAL DATA LOADED'); // TODO: Delete this line
    return todayMoodAssessments;
  }
}