import 'package:passi_app/models/screen_args/screen_args.dart';

class EventCheckoutScreenArgs implements ScreenArgs {
  late final String id;

  EventCheckoutScreenArgs({
    required this.id,
  });

  @override
  Map<String, dynamic> queryParams() {
    return {"id": id};
  }

  EventCheckoutScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
