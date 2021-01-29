import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/utils/metrics.dart';
import 'views/utils/app_theme.dart';
import 'views/ui/onboarding_screen.dart';
import 'views/ui/mood_assessment_screen.dart';
import 'views/ui/main_screen.dart';


class MindTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        appSystemUiOverlayStyle
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      //home: OnboardingScreen(),
      //home: MoodAssessmentScreen(),
      home: MainScreen(),
    );
  }
}
