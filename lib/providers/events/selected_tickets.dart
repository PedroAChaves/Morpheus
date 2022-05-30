import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:morpheus/models/event.dart';

class SelectedTicketsProvider extends ChangeNotifier {
  final List<TicketOption> _tickets = [];

  UnmodifiableListView<TicketOption> get tickets =>
      UnmodifiableListView(_tickets);

  add(TicketOption ticket) {
    var addedQuantity = _tickets.where((t) => t.id == ticket.id).length;
    if (addedQuantity < ticket.maximumBuysQuantity) {
      _tickets.add(ticket);
    }
    notifyListeners();
  }

  remove(TicketOption ticket) {
    var containsTicket = _tickets.contains(ticket);
    if (containsTicket) {
      _tickets.remove(ticket);
    }
    notifyListeners();
  }

  clear() {
    _tickets.clear();
    notifyListeners();
  }
}
