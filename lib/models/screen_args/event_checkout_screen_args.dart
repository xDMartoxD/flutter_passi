import 'package:passi_app/models/screen_args/screen_args.dart';

class EventCheckoutScreenArgs implements ScreenArgs {
  late final String id;
  late final String? code;

  EventCheckoutScreenArgs({required this.id, this.code});

  @override
  Map<String, dynamic> queryParams() {
    return {'discountCode': code};
  }

  EventCheckoutScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['discountCode'];
  }

  @override
  Map<String, String> params() {
    return {'id': id};
  }
}
