import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/home_page.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_colors.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';
import 'calendar_page/calendar_page.dart';
import 'analytics_page/analytics_page.dart';


class MainScreen extends StatefulWidget {
  MoodAssessment _newMoodAssess;

  MainScreen({MoodAssessment newMoodAssess}) {
    _newMoodAssess = newMoodAssess;
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Content {
  @override
  Widget build(BuildContext context) {
    loadContent('homePage');
    return CupertinoTabScaffold(
        tabBar: CustomBottomNavigationBar(),
        tabBuilder: _tabBuilder
    );
  }

  Widget _tabBuilder (context, index) {
    switch(index) {
      case 0:
        return HomePage(newMoodAssess: widget._newMoodAssess);
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