import 'package:flutter/material.dart';
import '../../utils/widget_data.dart';
import '../../utils/metrics.dart';


class EmptyMoodAssessmentCard extends StatelessWidget with WidgetData {
  @override
  Widget build(BuildContext context) {
    setWidgetName('emptyMoodAssessmentCard');
    return Container(
      margin: EdgeInsets.only(left: dp(16), right: dp(16), bottom: dp(12)),
      width: double.infinity,
      height: dp(136),
      decoration: BoxDecoration(
        color: colors['background'],
        borderRadius: BorderRadius.all(Radius.circular(dp(16))),
      ),
      child: Container(
        padding: EdgeInsets.only(left: dp(16), right: dp(32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: dp(164),
              height: dp(46),
              child: FlatButton(
                onPressed: () { print('Assess'); },
                color: colors['button'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(dp(12))
                ),
                child: Text(
                  content['buttonText'],
                  style: textStyles['button'],
                ),
              ),
            ),
            Container(
              width: dp(96),
              height: dp(96),
              decoration: BoxDecoration(
                color: colors['emptySphere'],
                shape: BoxShape.circle
              ),
            )
          ],
        ),
      ),
    );
  }
}