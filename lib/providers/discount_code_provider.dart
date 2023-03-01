import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';

import '../models/DiscountCode.dart';
import '../models/EventCategory.dart';
import '../utils/amplify_utils.dart';

class DiscountCodeProvider with ChangeNotifier {
  List<_DiscountCode> _discountCodes = <_DiscountCode>[];
  DiscountCode? _discountCode;
  List<_DiscountCode> get discountCodes => [..._discountCodes];
  DiscountCode? get discountCode => _discountCode;

  void addDiscountCode({required String discountCode, required String eventId}) {
    if (discountCodeExists(eventId) != null) {
      return;
    }
    _discountCodes
        .add(_DiscountCode(discountCode: discountCode, eventId: eventId, type: null, value: null));
    notifyListeners();
  }

  String? discountCodeExists(String eventId) {
    final discountCode = _discountCodes.firstWhere((element) => element.eventId == eventId,
        orElse: () => _DiscountCode(discountCode: '', eventId: ''));
    if (discountCode.discountCode == '') {
      return null;
    }
    return discountCode.discountCode;
  }

  Future<void> fetchDiscountCode(String eventID, String code) async {
    try {
      final request = apiKeyRequest(
        ModelQueries.list(
          DiscountCode.classType,
          where: DiscountCode.CODE.eq(code).and(
                DiscountCode.EVENT.eq(eventID),
              ),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paginatedDiscountCodes = response.data;
      if (paginatedDiscountCodes == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      _discountCode = paginatedDiscountCodes.items[0];
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  void removeDiscountCode() {
    _discountCode = null;
  }
}

class _DiscountCode {
  final String discountCode;
  final String eventId;
  final String? type;
  final double? value;
  _DiscountCode({
    required this.discountCode,
    required this.eventId,
    this.type,
    this.value,
  });
}
