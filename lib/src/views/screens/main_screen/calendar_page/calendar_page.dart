import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/custom_text_styles.dart';
import '../../../utils/metrics.dart';
import '../../../../business_logic/models/mood_assessment.dart';
import '../../../../business_logic/services/database_provider.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 2),
        () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Календарь',
      ),
      body: Center(
        child: Container(
          width: dp(100),
          height: dp(100),
          color: Colors.green,
          child: _buildText(),
        ),
      ),
    );
  }

  Widget _buildText() {
    var text = DatabaseProvider.db.getMoodAssessments().toString();
    return FutureBuilder<String>(
      future: _calculation,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data,
            style: CustomTextStyles.basicH1Medium,
          );
        } else {
          return Container(color: Colors.red);
        }
      },
    );
  }
}