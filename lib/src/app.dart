import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/views/ui/mood_assessment_screen.dart';
import 'views/ui/onboarding_screen.dart';
import 'views/utils/app_colors.dart';


class MindTrackerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: AppColors.app['appBarColor']
        ),
        canvasColor: AppColors.app['backgroundColor'],
      ),
      home: OnboardingScreen(1),
      //home: MoodAssessmentScreen(showSkipButton: false),
    );
  }
}
