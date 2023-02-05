import 'package:passi_app/models/screen_args/screen_args.dart';

class EventDetailScreenArgs implements ScreenArgs {
  late final String id;
  late final String imageUrl;

  EventDetailScreenArgs({required this.id, required this.imageUrl});

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data["id"] = id;
    return data;
  }

  EventDetailScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
