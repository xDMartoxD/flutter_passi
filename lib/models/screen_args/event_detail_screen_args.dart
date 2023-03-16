import 'package:passi_app/models/screen_args/screen_args.dart';

class EventDetailScreenArgs implements ScreenArgs {
  late final String id;
  late final String? promoterCode;

  EventDetailScreenArgs({required this.id, this.promoterCode});

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{
      'promoterCode': promoterCode ?? ''
    };
    return data;
  }

  EventDetailScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promoterCode = json['promoterCode'];
  }

  @override
  Map<String, String> params() {
    return {
      'id': id,
    };
  }
}
