import 'package:flutter/material.dart';
import '../utils/widget_data.dart';
import '../utils/metrics.dart';


class MainScreen extends StatelessWidget with WidgetData {
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
      body: ListView(
        children: List.generate(4, (index) => _buildMoodAssessmentCard(index+1)),
      )
    );
  }

  Widget _buildMoodAssessmentCard(mood) {
    final _textStyles = textStyles['moodAssessmentCard'];
    final _colors = colors['moodAssessmentCard'];
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(12)),
      width: double.infinity,
      height: dp(136),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            //color: Colors.red,
            margin: EdgeInsets.only(top: dp(16), left: dp(24), bottom: dp(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: dp(41),
                  child: Text(
                    'День  |  09:21',
                    style: _textStyles['dayTime'],
                  ),
                ),
                Container(
                  height: dp(41),
                  child: Text(
                      'Неплохо',
                    style: _textStyles['mood'],
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
                            '${mood-1}',
                            style: _textStyles['events'],
                          ),
                          decoration: BoxDecoration(
                            color: _colors['eventCountCircle'],
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: dp(8),
                        ),
                        Text(
                          'Событий',
                          style: _textStyles['events'],
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: _colors['background'],
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
    );
  }

}