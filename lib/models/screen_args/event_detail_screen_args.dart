import 'package:passi_app/models/screen_args/screen_args.dart';

class EventDetailScreenArgs implements ScreenArgs {
  late final String id;

  EventDetailScreenArgs({required this.id});

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  EventDetailScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  @override
  Map<String, String> params() {
    return {
      'id': id,
    };
  }
}
