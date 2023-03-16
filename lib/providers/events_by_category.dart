import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/utils/amplify_utils.dart';
import '../models/Event.dart';

class EventsByCategoryProvider with ChangeNotifier {
  final String categoryId;
  List<Event> _events = [];
  GraphQLRequest<PaginatedResult<Event>>? _requestForNextToken;
  bool _hasNextResult = false;

  EventsByCategoryProvider({required this.categoryId}) {
    fetchEventsByCategory();
  }

  List<Event> get events {
    return [..._events];
  }

  Future<void> fetchEventsByCategory() async {
    try {
      final request = apiKeyRequest(
        ModelQueries.list(
          Event.classType,
          where: Event.EVENTCATEGORY.eq(categoryId).and(
                Event.FINISHDATETIME.gt(
                  DateTime.now().toIso8601String(),
                ),
              ),
        ),
      );
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
      safePrint('Query failed: $e');
    }
  }

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
      safePrint('Query failed: $e');
    }
  }
}
