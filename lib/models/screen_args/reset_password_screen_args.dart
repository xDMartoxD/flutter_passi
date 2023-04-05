import 'package:passi_app/models/screen_args/screen_args.dart';

class ResetPasswordScreenArgs implements ScreenArgs {
  late final String username;

  ResetPasswordScreenArgs({required this.username});

  @override
  Map<String, dynamic> queryParams() {
    return {};
  }

  ResetPasswordScreenArgs.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  @override
  Map<String, String> params() {
    return {'username': username};
  }
}
