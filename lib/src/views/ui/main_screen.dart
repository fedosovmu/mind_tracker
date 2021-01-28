import 'package:flutter/material.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';
import 'widgets/mood_assessment_card.dart';


class MainScreen extends StatelessWidget with WidgetData {
  var _moodAssess;

  MainScreen ({int moodAssess = null}) {
    if (moodAssess != null) {
      _moodAssess = moodAssess;
    } else {
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
    var paint = Paint()
        ..color = Colors.red
        ..strokeWidth = dp(5)
        ..strokeCap = StrokeCap.round;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}