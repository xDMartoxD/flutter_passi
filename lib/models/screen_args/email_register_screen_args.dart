import 'package:passi_app/models/screen_args/screen_args.dart';

class EmailRegisterScreenArgs implements ScreenArgs {
  late final bool comesFromEventDetails;
  late final String id;
  EmailRegisterScreenArgs({required this.comesFromEventDetails});

  @override
  Map<String, dynamic> queryParams() {
    return {
      'comesFromEventDetails': comesFromEventDetails.toString(),
    };
  }

  EmailRegisterScreenArgs.fromJson(Map<String, dynamic> json) {
    comesFromEventDetails = (json['comesFromEventDetails'] as String).parseBool();
    id = json['id'];
  }

  @override
  Map<String, String> params() {
    return {
      'id': id,
    };
  }
}

extension BoolParsing on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
