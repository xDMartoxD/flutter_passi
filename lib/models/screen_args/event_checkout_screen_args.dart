import 'package:passi_app/models/screen_args/screen_args.dart';

class EventCheckoutScreenArgs implements ScreenArgs {
  late final String id;
  late final String? discountCode;

  EventCheckoutScreenArgs({required this.id, this.discountCode});

  @override
  Map<String, dynamic> queryParams() {
    return {'discountCode': discountCode};
  }

  EventCheckoutScreenArgs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discountCode = json['discountCode'];
  }

  @override
  Map<String, String> params() {
    return {'id': id};
  }
}
