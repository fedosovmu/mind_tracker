import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/today_mood_sssessments.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../utils/metrics.dart';
import '../../../../business_logic/services/database_provider.dart';
import '../../../../business_logic/models/mood_assessment.dart';


class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Аналитика',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: dp(100),
              height: dp(100),
              color: Colors.green,
              child: FlatButton(
                onPressed: () {
                  print('---');
                },
                child: Text('---'),
              ),
            ),
            Container(
              width: dp(100),
              height: dp(100),
              color: Colors.red,
              child:  FlatButton(
                onPressed: () {
                  Provider.of<TodayMoodAssessments>(context, listen: false).removeAll();
                },
                child: Text('Удалить все оценки'),
              ),
            )
          ],
        ),
      ),
    );
  }
}