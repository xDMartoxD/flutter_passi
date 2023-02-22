import 'package:passi_app/models/screen_args/screen_args.dart';

class EventDetailScreenArgs implements ScreenArgs {
  late final String id;
  late final String imageUrl;
  late String? promoterCode;

  EventDetailScreenArgs(
      {required this.id, required this.imageUrl, this.promoterCode});

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data["id"] = id;
    data["promoterCode"] = promoterCode;
    return data;
  }

  EventDetailScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    promoterCode = json['promoterCode'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
