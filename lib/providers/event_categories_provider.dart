import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/utils/amplify_utils.dart';
import '../models/ModelProvider.dart';

class EventCategoriesProvider with ChangeNotifier {
  List<EventCategory> _eventCategories = [];
  GraphQLRequest<PaginatedResult<EventCategory>>? _requestForNextToken;
  bool _hasNextResult = false;

  List<EventCategory> get eventCategroies {
    return [..._eventCategories];
  }

  Future<void> fetchEventCategories() async {
    try {
      final request = apiKeyRequest(ModelQueries.list(EventCategory.classType));
      final response = await Amplify.API.query(request: request).response;
      final paginatedEventCategories = response.data;
      if (paginatedEventCategories == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      _requestForNextToken = paginatedEventCategories.requestForNextResult;
      _hasNextResult = paginatedEventCategories.hasNextResult;
      final List<EventCategory> loadedEventCategories = [];
      for (var element in paginatedEventCategories.items) {
        if (element != null) {
          loadedEventCategories.add(element);
        }
      }
      _eventCategories = loadedEventCategories;

      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

//   Future<void> _fetchMoreEventCategories() async {
//     try {
//       final request = ModelQueries.list(EventCategory.classType);
//       final response = await Amplify.API.query(request: request).response;
//       final paginatedEventCategories = response.data;
//       if (paginatedEventCategories == null) {
//         print('errors: ${response.errors}');
//       }

//       paginatedEventCategories?.requestForNextResult!;
//     } on ApiException catch (e) {
//       print('Query failed: $e');
//       return null;
//     }
//   }
}
