import 'package:flutter/widgets.dart';
import 'package:mind_tracker/src/business_logic/models/event.dart';
import 'package:mind_tracker/src/business_logic/services/cloud_firestore_provider.dart';
import 'package:mind_tracker/src/business_logic/services/firebase_auth_provider.dart';


class EventsProvider extends ChangeNotifier {
  final _defaultEvents = [
    Event(icon: 'alcohol', title: 'Алкоголь'),
    Event(icon: 'bed', title: 'Хороший сон'),
    Event(icon: 'food', title: 'Хорошая еда'),
    Event(icon: 'stress', title: 'Стресс')
  ];

  List<Event> _userEvents = [];
  List<Event> get events => [..._defaultEvents, ..._userEvents];

  Future<void> loadData() async {
    _userEvents = await CloudFirestoreProvider.getUserEventsOfAuthorizedUser();
    notifyListeners();
    return;
  }

  void addUserEvent(Event userEvent) {
    final uid = FirebaseAuthProvider.uid;
    if (uid != null) {
      _userEvents.add(userEvent);
      CloudFirestoreProvider.addUserEvent(userEvent);
      notifyListeners();
    }
  }
}