import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/business_logic/viewmodels/providers_initializer.dart';
import 'dart:async';
import 'src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final moodAssessmentsProvider = await ProvidersInitializer.getMoodAssessmentsProvider();
  runApp(
      ChangeNotifierProvider(
        create: (context) => moodAssessmentsProvider,
        child: MindTrackerApp(),
      )
  );
}




