import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';

import '../utils/amplify_utils.dart';

class EventProvider with ChangeNotifier {
  final String eventId;
  Event? _event;
  EventProvider({required this.eventId});
  Event? get event => _event;

  Future<void> setEvent() async {
    try {
      final request = apiKeyRequest(
        ModelQueries.get(Event.classType, EventModelIdentifier(id: eventId)),
      );
      final response = await Amplify.API.query(request: request).response;
      final eventResponse = response.data;
      if (eventResponse == null) {
        safePrint('errors: ${response.errors}');
        return;
      }

      _event = eventResponse;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  Future<void> refreshEvent() async {
    if (event == null) {
      return;
    }
    try {
      final request = apiKeyRequest(
          ModelQueries.get(Event.classType, event!.modelIdentifier));
      final response = await Amplify.API.query(request: request).response;
      final refreshedEvent = response.data;
      if (refreshedEvent == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      _event = refreshedEvent;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: ${e.message}');
    }
  }

  Future<Event?> getEventById(String id) async {
    try {
      final request = apiKeyRequest(
        ModelQueries.get(Event.classType, EventModelIdentifier(id: id)),
      );
      final response = await Amplify.API.query(request: request).response;
      final event = response.data;
      if (event == null) {
        safePrint('errors: ${response.errors}');
        return null;
      }
      return event;
    } on ApiException catch (e) {
      safePrint('Query failed: ${e.message}');
    }
    return null;
  }
}
