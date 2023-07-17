import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:passi_app/providers/event_provider.dart';

import '../models/DiscountCode.dart';
import '../utils/amplify_utils.dart';

class DiscountCodesByEventProvider with ChangeNotifier {
  EventProvider? eventProvider;
  DiscountCode? _discountCode;
  DiscountCode? get discountCode => _discountCode;

  DiscountCodesByEventProvider({this.eventProvider});

  void setDiscountCode(String code) async {
    if (eventProvider == null) {
      return;
    }
    try {
      final request = cognitoRequest(
        ModelQueries.get(
          DiscountCode.classType,
          DiscountCodeModelIdentifier(
              code: code, eventID: eventProvider!.eventId),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final discountCode = response.data;
      if (discountCode == null) {
        safePrint('errors: ${response.errors}');
      }
      _discountCode = discountCode;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return null;
    } finally {
      notifyListeners();
    }
  }

  void removeDiscountCode() {
    _discountCode = null;
    notifyListeners();
  }
}
