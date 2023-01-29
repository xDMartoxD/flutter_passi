import 'package:passi_app/models/event.dart';

class EventCategory {
  final String id;
  final String name;
  final List<Event> events;

  EventCategory({required this.id, required this.name, required this.events});
}
