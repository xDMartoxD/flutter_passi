import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:passi_app/providers/event_provider.dart';

import '../models/DiscountCode.dart';
import '../utils/amplify_utils.dart';

class DiscountCodesByEventProvider with ChangeNotifier {
  EventProvider? eventProvider;
  final List<_DiscountCode> _discountCodes = <_DiscountCode>[];
  DiscountCode? _discountCode;
  // ignore: library_private_types_in_public_api
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
        const discountCodesByEvent = 'discountCodesByEvent';
        String graphQLDocument = '''
query DiscountCodesByEvent(\$eventID: ID!) {
  $discountCodesByEvent(eventID: \$eventID) {
    items {
       code
      actualUse
      createdAt
      discount
      eventID
      id
      maxUse
      updatedAt
      userID
      validUntil
    }
  }
}

''';

        final discountCodesByEventRequest = apiKeyRequest(GraphQLRequest(
          document: graphQLDocument,
          variables: <String, String>{'eventID': eventProvider!.event!.id},
          decodePath: discountCodesByEvent,
        ));
        final responseGraphQLDocument =
            await Amplify.API.query(request: discountCodesByEventRequest).response;
        if (responseGraphQLDocument.data == null) {
          safePrint('errors: ${responseGraphQLDocument.errors}');
          return;
        }
        final data = jsonDecode(responseGraphQLDocument.data);
        final discountCodesMap =
            List<Map<String, dynamic>>.from(data[discountCodesByEvent]['items']);
        List<DiscountCode?> loadedDiscountCodes = [];
        for (var discountCodeMap in discountCodesMap) {
          final discountCode = DiscountCode(
            code: discountCodeMap['code'],
            actualUse: discountCodeMap['actualUse'],
            validUntil: TemporalDateTime.fromString(discountCodeMap['validUntil']),
            discount: discountCodeMap['discount'],
            event: eventProvider!.event!,
            createdAt: TemporalDateTime.fromString(discountCodeMap['createdAt']),
            updatedAt: TemporalDateTime.fromString(discountCodeMap['updatedAt']),
          );
          loadedDiscountCodes.add(discountCode);
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
