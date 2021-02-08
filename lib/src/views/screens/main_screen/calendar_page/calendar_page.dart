import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/utils/theme/custom_text_styles.dart';
import '../../../utils/metrics.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
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
        ),
      ),
    );
  }
}