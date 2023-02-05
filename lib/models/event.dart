class Event {
  late int id;
  late String title;
  late String imageUrl;
  late DateTime finishDate;

  Event({required this.id, required this.title});

  Event.fromJson(Map<String, Object> json) {
    id = json["id"] as int;
    title = json["title"] as String;
    finishDate = DateTime.parse(json["finishDate"] as String);
    imageUrl = json["imageUrl"] as String;
  }
}
