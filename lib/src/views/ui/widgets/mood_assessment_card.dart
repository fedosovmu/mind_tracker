import 'package:flutter/material.dart';
import '../../utils/widget_data.dart';
import '../../utils/metrics.dart';


class MoodAssessmentCard extends StatelessWidget with WidgetData {
  var _mood;

  MoodAssessmentCard (mood) {
    _mood = mood;
  }


  @override
  Widget build(BuildContext context) {
    setWidgetName('moodAssessmentCard');
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(12)),
      width: double.infinity,
      height: dp(136),
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: dp(16), left: dp(24), bottom: dp(14)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: dp(41),
                child: Text(
                  'День  |  09:21',
                  style: textStyles['dayTime'],
                ),
              ),
              Container(
                height: dp(41),
                child: Text(
                  'Неплохо',
                  style: textStyles['mood'],
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        width: dp(24),
                        height: dp(24),
                        padding: EdgeInsets.only(left: dp(8.5), top: dp(4)),
                        child: Text(
                          '${_mood}',
                          style: textStyles['events'],
                        ),
                        decoration: BoxDecoration(
                          color: colors['eventCountCircle'],
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: dp(8),
                      ),
                      Text(
                        'Событий',
                        style: textStyles['events'],
                      ),
                    ],
                  ),
                ),
              )
            ]
        ),
      ),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
    );
  }

}