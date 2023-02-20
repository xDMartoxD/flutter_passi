class EventCategory {
  final String id;
  final String name;
  final List<Event> events;

  EventCategory({required this.id, required this.name, required this.events});
}

class Event {
  late int id;
  late String title;
  late String imageUrl;
  late DateTime finishDate;

  Event({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.finishDate,
  });

  Event.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    title = data["title"];
    imageUrl = data["imageUrl"];
    finishDate = DateTime.parse(data["finishDate"]);
  }
}
