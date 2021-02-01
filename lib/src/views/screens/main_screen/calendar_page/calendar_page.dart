import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import '../../../utils/metrics.dart';


class CalendarPage extends StatelessWidget {
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
          color: Colors.yellow,
        ),
      )
    );
  }
}