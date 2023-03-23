import 'package:passi_app/models/screen_args/screen_args.dart';

class ErrorsScreenArgs implements ScreenArgs {
  late final String error;

  ErrorsScreenArgs({required this.error});

  @override
  Map<String, dynamic> queryParams() {
    final Map<String, dynamic> data = <String, dynamic>{
      'error': error,
    };
    return data;
  }

  ErrorsScreenArgs.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  @override
  Map<String, String> params() {
    return {};
  }
}
