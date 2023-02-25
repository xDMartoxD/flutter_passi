import 'package:flutter/foundation.dart';

class EventState with ChangeNotifier, DiagnosticableTreeMixin {
  String _event = 'No Event';

  String get event => _event;

  String _name = "";

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set event(String value) {
    _event = value;
    notifyListeners();
  }
}
