class Event {
  late int id;
  late String title;
  late DateTime finishDate;
  late String imageUrl;

  Event({
    required this.id,
    required this.title,
    required this.finishDate,
    required this.imageUrl,
  });

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    finishDate = DateTime.parse(json['finishDate']);
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['finishDate'] = this.finishDate.toIso8601String();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
