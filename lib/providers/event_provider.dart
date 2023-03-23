import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';

import '../utils/amplify_utils.dart';

class EventProvider with ChangeNotifier {
  final String eventId;

  EventProvider({required this.eventId});
  Event? event;

  Future<void> setEvent() async {
    try {
      final request = apiKeyRequest(
        ModelQueries.get(Event.classType, eventId),
      );
      final response = await Amplify.API.query(request: request).response;
      final eventResponse = response.data;
      if (eventResponse == null) {
        safePrint('errors: ${response.errors}');
        return;
      }

      event = eventResponse;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  Future<void> refreshEvent() async {
    if (event != null) {
      try {
        final request = apiKeyRequest(ModelQueries.get(Event.classType, event!.id));
        final response = await Amplify.API.query(request: request).response;
        final refreshedEvent = response.data;
        if (refreshedEvent == null) {
          safePrint('errors: ${response.errors}');
          return;
        }
        event = refreshedEvent;
        notifyListeners();
      } on ApiException catch (e) {
        safePrint('Query failed: ${e.message}');
      }
    }
  }
}
