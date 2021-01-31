import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind_tracker/src/views/utils/content.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import '../../utils/metrics.dart';
import 'mood_assessment_card.dart';
import 'empty_mood_assessment_card.dart';
import '../../common_widgets/custom_app_bar.dart';
import '../../common_widgets/custom_bottom_navigation_bar.dart';


class MainScreen extends StatefulWidget {
  var _moodAssess;

  MainScreen({int moodAssess = null}) {
      _moodAssess = moodAssess;
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
      body: _buildCardListView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Widget _buildCardListView() {
    var moodAssessmentCards = [];
    if (widget._moodAssess != null) {
      moodAssessmentCards = List.generate(1, (index) =>
          MoodAssessmentCard(
            mood: widget._moodAssess,
            eventNumber: widget._moodAssess
          )
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