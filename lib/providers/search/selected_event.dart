import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';

class SelectedEventProvider extends ChangeNotifier {
  late AppEvent _event;
  bool _hasValue = false;

  AppEvent get event => _event;
  bool get hasValue => _hasValue;

  void setValue(AppEvent selectedEvent) {
    _event = selectedEvent;
    _hasValue = true;
    notifyListeners();
  }

  void clearValue() {
    _hasValue = false;
    notifyListeners();
  }
}
