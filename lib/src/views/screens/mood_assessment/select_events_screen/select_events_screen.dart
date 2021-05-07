import 'package:collection/equality.dart';
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


class SelectEventsScreen extends StatefulWidget {
  final List<Event> oldSelectedEvents;

  SelectEventsScreen(this.oldSelectedEvents);

  @override
  _SelectEventsScreenState createState() => _SelectEventsScreenState();
}

class _SelectEventsScreenState extends State<SelectEventsScreen> {
  List<Event> _selectedEvents;
  List<EventIcon> _eventIcons;
  bool _enableButton;

  List<EventIcon> _convertEventsToEventIcons(List<Event> events) {
    return events.map((event) => EventIcon(
                    event,
                    onChanged: () {
                      setState(() {
                        _updateSelectedEvents();
                        _enableButton = _isButtonEnable();
                      });
                    },
                    isSelected: _selectedEvents.contains(event))).toList();
  }

  void _updateSelectedEvents() {
    _selectedEvents = _eventIcons.where(
            (eventIcon) => eventIcon.isSelected).map(
            (eventIcon) => eventIcon.event).toList();
  }

  bool _isButtonEnable() {
    return !ListEquality().equals(widget.oldSelectedEvents, _selectedEvents);
  }

  @override
  void initState() {
    super.initState();
    _selectedEvents = widget.oldSelectedEvents;
    _enableButton = _isButtonEnable();
  }

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
                  _eventIcons = _convertEventsToEventIcons(eventsProvider.events);
                  return GridView.count(
                    physics: ClampingScrollPhysics(),
                    mainAxisSpacing: dp(16),
                    crossAxisSpacing: dp(24),
                    crossAxisCount: 4,
                    childAspectRatio: EventIcon.aspectRatio,
                    children: [
                      ..._eventIcons,
                      AddUserEventButton(
                        onPressed: () async {
                          print('Add user event button pressed');
                          final newUserEvent = await Navigator.of(context).pushNamed('/createUserEventTitle');
                          print('New user event $newUserEvent');
                          if (newUserEvent != null) {
                            Provider.of<EventsProvider>(context, listen: false).addUserEvent(newUserEvent);
                          }
                        },
                      )
                    ]
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
                  title: widget.oldSelectedEvents.isEmpty ? 'Готово' : 'Сохранить',
                  enabled: _enableButton,
                  onPressed: () {
                    print('Select events button pressed');
                    Navigator.of(context).pop(_selectedEvents);
                  }
                ),
              )
          )
        ],
      ),
    );
  }
}