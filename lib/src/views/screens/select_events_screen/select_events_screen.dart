import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/main_button.dart';
import 'package:mind_tracker/src/views/screens/select_events_screen/widgets/event_icon.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class SelectEventsScreen extends StatelessWidget {
  static const _pathToBackIcon = 'assets/icons/ui/back.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Выбор собятия',
        leading: IconButton(
          iconSize: dp(32),
          icon: Image.asset(_pathToBackIcon),
          onPressed: () {
            print('Back button pressed');
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return true;
              },
              child: GridView.count(
                physics: ClampingScrollPhysics(),
                mainAxisSpacing: dp(16),
                crossAxisSpacing: dp(24),
                crossAxisCount: 4,
                childAspectRatio: EventIcon.aspectRatio,
                children: List.generate(7, (index) {
                  return EventIcon();
                }),
              ),
            ),
          ),
          Positioned(
            left: dp(16),
            right: dp(16),
            bottom: dp(8),
              child: MainButton(
                title: 'Готово',
                onPressed: () {
                  print('Select events button pressed');
                  Navigator.pop(context);
                }
              )
          )
        ],
      ),
    );
  }
}