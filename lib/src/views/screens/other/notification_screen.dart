import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Уведомления',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: dp(100),
          height: dp(100),
          color: Colors.red,
        ),
      ),
    );
  }

}