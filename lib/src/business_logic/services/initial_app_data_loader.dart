import 'database_provider.dart';
import '../models/initial_app_data.dart';
import 'dart:async';


abstract class InitialAppDataLoader {
  static Future<InitialAppData> loadInitialAppData () async {
    final moodAssessments = await DatabaseProvider.db.getMoodAssessments();
    final initialAppData = InitialAppData(
      todayMoodAssessments: moodAssessments
    );
    print('INITIAL DATA LOADED'); // TODO: Delete this line
    return initialAppData;
  }
}