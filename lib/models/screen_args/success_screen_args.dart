import 'package:passi_app/models/screen_args/screen_args.dart';

class SuccessScreenArgs implements ScreenArgs {
  late final String title;
  late final String? message;

  SuccessScreenArgs({required this.title, required this.message});

  @override
  Map<String, dynamic> queryParams() {
    return {'title': title, 'message': message};
  }

  SuccessScreenArgs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
