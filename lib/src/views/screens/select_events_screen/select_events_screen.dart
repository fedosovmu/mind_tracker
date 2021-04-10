import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/select_events_screen/widgets/event_icon.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';


class SelectEventsScreen extends StatelessWidget {
  static const _pathToBackIcon = 'assets/icons/ui/back.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Выбор собятия',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Back button pressed');
            Navigator.of(context).pop();
          }
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(8)),
            child: GlowDisabler(
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
            bottom: 0,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: dp(8)),
                child: StandardButton(
                  title: 'Готово',
                  onPressed: () {
                    print('Select events button pressed');
                    Navigator.of(context).pop();
                  }
                ),
              )
          )
        ],
      ),
    );
  }
}