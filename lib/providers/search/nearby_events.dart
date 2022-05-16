import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';

class NearbyEventsProvider extends ChangeNotifier {
  final List<AppEvent> _events = [];

  UnmodifiableListView<AppEvent> get events => UnmodifiableListView(_events);

  saveAll(List<AppEvent> events) {
    for (var e in events) {
      if (!_events.contains(e)) _events.add(e);
    }
    notifyListeners();
  }

  clear() {
    _events.clear();
    notifyListeners();
  }
}
