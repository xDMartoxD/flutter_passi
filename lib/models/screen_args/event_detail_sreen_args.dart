class EventDetailScreenArgs {
  late String id;
  late String imageUrl;

  EventDetailScreenArgs({required this.id, required this.imageUrl});

  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    return data;
  }

  EventDetailScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }
}
