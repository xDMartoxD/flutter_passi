import 'package:passi_app/models/screen_args/screen_args.dart';

class EventDetailScreenArgs implements ScreenArgs {
  late final String id;
  late final String? code;

  EventDetailScreenArgs({required this.id, this.code});

  @override
  Map<String, dynamic> queryParams() {
    return {'code': code};
  }

  EventDetailScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['promoterCode'];
  }

  @override
  Map<String, String> params() {
    return {
      'id': id,
    };
  }
}
