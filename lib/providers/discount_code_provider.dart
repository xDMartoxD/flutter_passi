import 'package:flutter/cupertino.dart';

class DiscountCodeProvider with ChangeNotifier {
  List<_DiscountCode> _discountCodes = <_DiscountCode>[];
  List get discountCodes => _discountCodes;

  void addDiscountCode(
      {required String discountCode, required String eventId}) {
    if (discountCodeExists(eventId) != null) {
      return;
    }
    _discountCodes.add(_DiscountCode(
        discountCode: discountCode, eventId: eventId, type: null, value: null));
    notifyListeners();
  }

  String? discountCodeExists(String eventId) {
    final discountCode = _discountCodes.firstWhere(
        (element) => element.eventId == eventId,
        orElse: () => _DiscountCode(discountCode: '', eventId: ''));
    if (discountCode.discountCode == '') {
      return null;
    }
    return discountCode.discountCode;
  }
}

class _DiscountCode {
  final String discountCode;
  final String eventId;
  final String? type;
  final double? value;
  _DiscountCode(
      {required this.discountCode,
      required this.eventId,
      this.type,
      this.value});
}
