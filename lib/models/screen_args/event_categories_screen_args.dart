import 'package:passi_app/models/screen_args/screen_args.dart';

class EventCategoriesOverviewScreenArgs implements ScreenArgs {
  late final String id;
  late final String categoryName;

  EventCategoriesOverviewScreenArgs({required this.id, required this.categoryName});

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
    };
    return data;
  }

  EventCategoriesOverviewScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
