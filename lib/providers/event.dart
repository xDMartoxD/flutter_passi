import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';

class EventProvider with ChangeNotifier {
  Event event;
  EventProvider({required this.event});
}
