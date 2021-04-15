import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';


class EventsProvider extends ChangeNotifier {
  final List<Event> events;

  EventsProvider(this.events);
}