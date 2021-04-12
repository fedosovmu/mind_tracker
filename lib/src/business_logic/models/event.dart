import 'package:flutter/material.dart';


class Event {
  final String icon;
  final String name;
  final String title;

  Event({@required this.icon, @required this.name, @required this.title});

  static Event fromMap(Map<String, dynamic> eventMap) {
    return Event(
      icon: eventMap['icon'],
      name: eventMap['name'],
      title: eventMap['title']
    );
  }

  Map<String, dynamic> toMap () {
    return {
      'icon': icon,
      'name': name,
      'title': title,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}