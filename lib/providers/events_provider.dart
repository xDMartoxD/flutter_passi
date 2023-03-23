import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/Event.dart';

import '../utils/amplify_utils.dart';

class EventsProvider with ChangeNotifier {
  EventsProvider();

  Future<Event?> getEventById(String id) async {
    try {
      final request = apiKeyRequest(
        ModelQueries.get(Event.classType, id),
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
