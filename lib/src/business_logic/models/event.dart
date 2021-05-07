import 'package:flutter/material.dart';


class Event {
  final String icon;
  final String title;

  Event({@required this.icon, @required this.title});

  static Event fromMap(Map<String, dynamic> eventMap) {
    return Event(
      icon: eventMap['icon'],
      title: eventMap['title']
    );
  }

  Map<String, dynamic> toMap () {
    return {
      'icon': icon,
      'title': title,
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  bool operator ==(Object other) {
    return other is Event && other.icon == icon && other.title == title;
  }
}