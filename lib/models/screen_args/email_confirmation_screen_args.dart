import 'package:passi_app/models/screen_args/screen_args.dart';

class EmailConfirmationScreenArgs implements ScreenArgs {
  late final String email;
  late final String password;
  EmailConfirmationScreenArgs({required this.email, required this.password});

  @override
  Map<String, dynamic> queryParams() {
    return {
      'email': email,
      'password': password,
    };
  }

  EmailConfirmationScreenArgs.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
