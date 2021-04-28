import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';


class EventsProvider extends ChangeNotifier {
  final _defaultEvents = [
    Event(icon: 'alcohol', title: 'Алкоголь'),
    Event(icon: 'bed', title: 'Хороший сон'),
    Event(icon: 'food', title: 'Хорошая еда')
  ];

  final List<Event> _userEvents;
  List<Event> get events => [..._defaultEvents, ..._userEvents];

  EventsProvider(this._userEvents);
}