import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/custom_bottom_navigation_bar.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'home_page/home_page.dart';
import 'analytics_page/analytics_page.dart';
import 'calendar_page/calendar_page.dart';


class MainScreen extends StatefulWidget {
  List<MoodAssessment> _todayMoodAssessments = [];

  MainScreen({List<MoodAssessment> todayMoodAssessments}) {
    _todayMoodAssessments.addAll(todayMoodAssessments);
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CustomBottomNavigationBar(),
        tabBuilder: _tabBuilder
    );
  }

  Widget _tabBuilder (context, index) {
    switch(index) {
      case 0:
        return HomePage(moodAssessments: widget._todayMoodAssessments);
        break;
      case 1:
        return AnalyticsPage();
        break;
      case 2:
        return CalendarPage();
        break;
    }
  }
}