import 'package:flutter/material.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';
import 'widgets/mood_assessment_card.dart';


class MainScreen extends StatelessWidget with WidgetData {
  var _moodAssess;

  MainScreen ({int moodAssess = null}) {
    if (moodAssess != null) {
      _moodAssess = moodAssess;
    }
    else {
      _moodAssess = 0;
    }
  }


  @override
  Widget build(BuildContext context) {
    setWidgetName('mainScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          content['title'],
          style: textStyles['title'],
        ),
        toolbarHeight: dp(56),
        titleSpacing: dp(16),
      ),
      body: ListView (
        children: List.generate(4, (index) =>
            MoodAssessmentCard(
              mood: index+1,
              eventNumber: index+1,
              dateTimeString: 'День  |  09:21',)
        ),
      )
    );
  }



}