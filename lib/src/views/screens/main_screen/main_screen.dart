import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/home_page.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:mind_tracker/src/business_logic/models/mood_assessment.dart';


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
    loadContent('mainScreen');
    return CupertinoPageScaffold(
      navigationBar: CustomAppBar(
          title: content['title']
      ),
        child: HomePage()
    );
      Scaffold(
      appBar: CustomAppBar(
        title: content['title'],
      ),
      body: HomePage(moodAssess: widget._newMoodAssess),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}