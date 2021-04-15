import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';


class EventsProvider extends ChangeNotifier {
  final List<Event> events;

  EventsProvider(this.events);

  static Future<EventsProvider> loadDataAndCreateProvider() async {
    final events = await CloudFirestoreProvider.getEvents();
    return EventsProvider(events);
    //return EventsProvider([]);
  }
}