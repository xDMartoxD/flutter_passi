class EventCategoriesOverviewScreenArgs {
  late String id;

  EventCategoriesOverviewScreenArgs({
    required this.id,
  });

  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    return data;
  }

  EventCategoriesOverviewScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, String> params() {
    return {"id": id};
  }
}
