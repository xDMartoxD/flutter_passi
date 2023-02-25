import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventState with ChangeNotifier, DiagnosticableTreeMixin {
  String _event = 'No Event';
  String get event => _event;
  set event(String value) {
    _event = value;
    notifyListeners();
  }
}
