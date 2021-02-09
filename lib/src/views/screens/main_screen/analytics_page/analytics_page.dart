import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../utils/metrics.dart';


class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Аналитика',
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            width: dp(100),
            height: dp(100),
          )
        ],
      )
    );
  }
}