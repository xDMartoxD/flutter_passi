import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:passi_app/providers/event_provider.dart';

import '../models/DiscountCode.dart';
import '../utils/amplify_utils.dart';

class DiscountCodesByEventProvider with ChangeNotifier {
  EventProvider? eventProvider;
  final List<_DiscountCode> _discountCodes = <_DiscountCode>[];
  DiscountCode? _discountCode;
  List<_DiscountCode> get discountCodes => [..._discountCodes];
  DiscountCode? get discountCode => _discountCode;
  List<DiscountCode?> _fetchedDiscountCodes = [];

  DiscountCodesByEventProvider({this.eventProvider});

  void addDiscountCode({required String discountCode, required String eventId}) {
    if (_discountCodeExists(eventId) != null) {
      return;
    }
    _discountCodes
        .add(_DiscountCode(discountCode: discountCode, eventId: eventId, type: null, value: null));
    notifyListeners();
  }

  String? _discountCodeExists(String eventId) {
    final discountCode = _discountCodes.firstWhere((element) => element.eventId == eventId,
        orElse: () => _DiscountCode(discountCode: '', eventId: ''));
    if (discountCode.discountCode == '') {
      return null;
    }
    return discountCode.discountCode;
  }

  Future<void> fetchDiscountCodes() async {
    if (eventProvider != null && eventProvider?.event != null) {
      try {
        final request = apiKeyRequest(
          ModelQueries.list(DiscountCode.classType,
              where: DiscountCode.EVENT.eq(eventProvider!.event!.id)),
        );
        final response = await Amplify.API.query(request: request).response;
        final paginatedDiscountCodes = response.data;
        if (paginatedDiscountCodes == null) {
          safePrint('errors: ${response.errors}');
          return;
        }
        List<DiscountCode?> loadedDiscountCodes = [];

        for (var element in paginatedDiscountCodes.items) {
          loadedDiscountCodes.add(element);
        }

        _fetchedDiscountCodes = loadedDiscountCodes;
        notifyListeners();
      } on ApiException catch (e) {
        safePrint('Query failed: $e');
      }
    }
  }

  void setDiscountCode(String code) {
    _discountCode = _fetchedDiscountCodes.firstWhere(
      (discountCode) => discountCode?.code == code,
    );
    notifyListeners();
  }

  void removeDiscountCode() {
    _discountCode = null;
    notifyListeners();
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
