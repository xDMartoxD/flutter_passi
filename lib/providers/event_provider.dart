import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';

import '../utils/amplify_utils.dart';

class EventProvider with ChangeNotifier {
  Event? event;

  Future<void> setEventById(String id) async {
    try {
      final request = apiKeyRequest(
        ModelQueries.get(Event.classType, id),
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
        print('Query failed: ${e.message}');
      }
    }
  }
}
