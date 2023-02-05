import 'package:passi_app/models/screen_args/screen_args.dart';

class EventCategoriesOverviewScreenArgs implements ScreenArgs {
  late final String id;

  EventCategoriesOverviewScreenArgs({
    required this.id,
  });

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    return data;
  }

  EventCategoriesOverviewScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  @override
  Map<String, String> params() {
    return {"id": id};
  }
}
