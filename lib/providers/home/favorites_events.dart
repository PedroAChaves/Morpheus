import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:morpheus/models/event.dart';

class FavoritesAppEventsProvider extends ChangeNotifier {
  final List<AppEvent> _events = [];

  UnmodifiableListView<AppEvent> get events => UnmodifiableListView(_events);

  save(AppEvent event) {
    if (!_events.contains(event)) {
      _events.add(event);
      notifyListeners();
    }
  }

  remove(AppEvent event) {
    if (_events.contains(event)) {
      _events.remove(event);
      notifyListeners();
    }
  }
}
