import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../models/Event.dart';
import '../models/EventCategory.dart';

class EventsByCategory with ChangeNotifier {
  final String categoryId;
  List<Event> _events = [];
  GraphQLRequest<PaginatedResult<Event>>? _requestForNextToken;
  bool _hasNextResult = false;

  EventsByCategory({required this.categoryId});
  List<Event> get events {
    return [..._events];
  }

  Future<void> fetchEventsByCategory() async {
    try {
      final request = ModelQueries.list(Event.classType);
      final response = await Amplify.API.query(request: request).response;
      final paginatedEventCategories = response.data;
      if (paginatedEventCategories == null) {
        print('errors: ${response.errors}');
        return;
      }
      _requestForNextToken = paginatedEventCategories.requestForNextResult;
      _hasNextResult = paginatedEventCategories.hasNextResult;
      final List<Event> loadedEvents = [];
      for (var element in paginatedEventCategories.items) {
        if (element != null) {
          loadedEvents.add(element);
        }
      }
      _events = loadedEvents;
      notifyListeners();
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }
}
