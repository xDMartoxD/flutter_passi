import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';

import '../utils/amplify_utils.dart';

class TicketCategoriesByEventProvider with ChangeNotifier {
  List<TicketCategory> _ticketCategories = [];
  bool _hasNextResult = false;
  GraphQLRequest<PaginatedResult<TicketCategory>>? _requestForNextToken;

  List<TicketCategory> get ticketCategories {
    return [..._ticketCategories];
  }

  Future<void> fetchTicketCategoriesByEventId(String eventId) async {
    try {
      final request = apiKeyRequest(
        ModelQueries.list(
          TicketCategory.classType,
          where: TicketCategory.EVENT.eq(eventId),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paginatedTicketCategories = response.data;
      if (paginatedTicketCategories == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      _hasNextResult = paginatedTicketCategories.hasNextResult;
      _requestForNextToken = paginatedTicketCategories.requestForNextResult;
      final List<TicketCategory> loadedTicketCategories = [];
      for (var element in paginatedTicketCategories.items) {
        if (element != null) {
          loadedTicketCategories.add(element);
        }
      }
      _ticketCategories = loadedTicketCategories;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: ${e.message}');
    }
  }

  TicketCategory? getTicketCategoryById(String id) {
    return _ticketCategories.firstWhere((tc) => tc.id == id);
  }
}
