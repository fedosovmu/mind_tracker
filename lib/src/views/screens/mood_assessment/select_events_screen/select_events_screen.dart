import 'package:flutter/material.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/viewmodels/events_provider.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/glow_disabler.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/select_events_screen/widgets/add_user_event_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/select_events_screen/widgets/event_icon.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:provider/provider.dart';


class SelectEventsScreen extends StatelessWidget {
  final List<Event> _oldSelectedEvents;
  List<Widget> _eventIcons;

  SelectEventsScreen(this._oldSelectedEvents);

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
              child: Consumer<EventsProvider>(
                builder: (context, eventsProvider, child) {
                  _eventIcons = eventsProvider.events.map((event) {
                    final bool isSelected = _oldSelectedEvents.contains(event);
                    return EventIcon(event, isSelected: isSelected);
                  }).toList();
                  return GridView.count(
                    physics: ClampingScrollPhysics(),
                    mainAxisSpacing: dp(16),
                    crossAxisSpacing: dp(24),
                    crossAxisCount: 4,
                    childAspectRatio: EventIcon.aspectRatio,
                    children: [..._eventIcons, AddUserEventButton()]
                  );
                }
              ),
            ),
          ),
          Positioned(
            left: dp(16),
            right: dp(16),
            bottom: 0,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: dp(16)),
                child: StandardButton(
                  title: 'Готово',
                  onPressed: () {
                    print('Select events button pressed');
                    final List<Event> selectedEvents = [];
                    for (EventIcon eventIcon in _eventIcons) {
                      if (eventIcon.isSelected) {
                        final event = eventIcon.event;
                        selectedEvents.add(event);
                      }
                    }
                    Navigator.of(context).pop(selectedEvents);
                  }
                ),
              )
          )
        ],
      ),
    );
  }
}