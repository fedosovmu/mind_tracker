import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/business_logic/services/initial_app_data_loader.dart';
import 'src/business_logic/models/today_mood_sssessments.dart';
import 'dart:async';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var todayMoodAssessments = await InitialAppDataLoader.loadTodayMoodAssessments();
  runApp(
      ChangeNotifierProvider(
        create: (context) => todayMoodAssessments,
        child: MindTrackerApp(),
      )
  );
}




