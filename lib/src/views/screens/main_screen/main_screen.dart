import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/views/screens/main_screen/home_page/home_page.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import '../../utils/metrics.dart';
import 'home_page/mood_assessment_card_list_view/mood_assessment_card.dart';
import 'home_page/mood_assessment_card_list_view/mood_assessment_empty_card.dart';
import '../../common_widgets/custom_app_bar.dart';
import '../../common_widgets/custom_bottom_navigation_bar.dart';
import '../../../business_logic/models/mood_assess.dart';


class MainScreen extends StatefulWidget {
  MoodAssess _newMoodAssess;

  MainScreen({MoodAssess newMoodAssess = null}) {
    _newMoodAssess = newMoodAssess;
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with Content {
  @override
  Widget build(BuildContext context) {
    loadContent('mainScreen');
    return Scaffold(
      appBar: CustomAppBar(
        title: content['title'],
      ),
      body: HomePage(moodAssess: widget._newMoodAssess),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}