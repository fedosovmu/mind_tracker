import 'package:flutter/material.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';
import 'widgets/mood_assessment_card.dart';


class MainScreen extends StatelessWidget with WidgetData {
  var _moodAssess;

  MainScreen ({int moodAssess = null}) {
    setWidgetName('mainScreen');
    if (moodAssess != null) {
      _moodAssess = moodAssess;
    } else {
      _moodAssess = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          content['title'],
          style: textStyles['title'],
        ),
        toolbarHeight: dp(56),
        titleSpacing: dp(16),
      ),
      body: CustomPaint(
        foregroundPainter: _SpherePainter(),
        child: Container(
          child: ListView (
            children: List.generate(4, (index) =>
                MoodAssessmentCard(
                  mood: index+1,
                  eventNumber: index+1,
                  dateTimeString: 'День  |  09:21',)
            ),
          ),
        ),
      )
    );
  }
}

class _SpherePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Color(0x5000FF00);

    const sphereImageAspectRatio = 257 / 214;
    const sphereImageWidth = 180;
    const sphereImageHeigth = sphereImageWidth / sphereImageAspectRatio;
    final rect = Rect.fromLTWH(dp(360 - sphereImageWidth-16), dp(0), dp(sphereImageWidth), dp(sphereImageHeigth));

    canvas.drawRect(rect, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}