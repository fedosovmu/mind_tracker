import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';
import 'widgets/mood_assessment_card.dart';

import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:async';
import 'dart:io';


class MainScreen extends StatefulWidget with WidgetData {
  var _moodAssess;

  MainScreen({int moodAssess = null}) {
      _moodAssess = moodAssess;
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetData {
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
      body: _buildCardListView()
    );
  }

  Widget _buildCardListView() {
    var moodAssessmentCards = List.generate(3, (index) =>
        MoodAssessmentCard(
          mood: 7 - index,
          eventNumber: index+1,
          dateTimeString: 'День  |  09:21',)
    );

    return Stack(
        children:[
          ListView (
              children: moodAssessmentCards
          ),
          ...List.generate(moodAssessmentCards.length, (index) {
            var mood = moodAssessmentCards[index].mood;
            return Positioned(
              top: dp(dp(-5) + index * dp(136)),
              left: dp(160),
              child: Image.asset(
                'assets/images/common/mood_spheres/$mood.png',
                scale: dp(2),
              )
            );
          })
        ]
    );
  }
}