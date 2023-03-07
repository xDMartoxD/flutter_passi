import '../models/my_models/event_category.dart';
import 'json_data.dart';

List<Event> events = data.map((e) => Event.fromJson(e)).toList();
List<EventCategory> event_categories = [
  EventCategory(id: "1", name: "Teatro", events: events.sublist(0, 10)),
  EventCategory(id: "2", name: "Conferencia", events: events.sublist(10, 20)),
  EventCategory(id: "3", name: "Fiesta", events: events.sublist(20, 30)),
  EventCategory(id: "4", name: "Concierto", events: events.sublist(30, 40)),
  EventCategory(id: "5", name: "Otro", events: events.sublist(40, 50)),
  EventCategory(id: "6", name: "Funcion", events: events.sublist(50, 60)),
  EventCategory(id: "7", name: "Deporte", events: events.sublist(50, 60))
];
