import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/business_logic/services/initial_app_data_loader.dart';
import 'dart:async';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final moodAssessmentsProvider = await InitialAppDataLoader.loadMoodAssessmentsProvider();
  runApp(
      ChangeNotifierProvider(
        create: (context) => moodAssessmentsProvider,
        child: MindTrackerApp(),
      )
  );
}




