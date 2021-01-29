import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/widget_data.dart';
import '../../utils/metrics.dart';
import 'mood_assessment_card.dart';
import 'empty_mood_assessment_card.dart';


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
        automaticallyImplyLeading: false,
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
    var moodAssessmentCards = [];
    if (widget._moodAssess != null) {
      moodAssessmentCards = List.generate(1, (index) =>
          MoodAssessmentCard(
            mood: widget._moodAssess,
            eventNumber: widget._moodAssess,
            dateTimeString: 'День  |  09:21',)
      );
    }

    final moodSpheres = List.generate(moodAssessmentCards.length, (index) {
      var mood = moodAssessmentCards[index].mood;
      if (mood != null) {
        return Positioned(
            top: dp(dp(-5) + index * dp(136)),
            left: dp(160),
            child: Image.asset(
              'assets/images/common/mood_spheres/$mood.png',
              scale: dp(2),
            )
        );
      }
    });

    return SingleChildScrollView(
      child: Stack(
          children:[
            Column(
              children: [
                ...moodAssessmentCards,
                EmptyMoodAssessmentCard()
              ],
            ),
            ...moodSpheres,
          ]
      ),
    );
  }
}