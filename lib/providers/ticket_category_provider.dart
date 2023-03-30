import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:passi_app/models/ModelProvider.dart';

import '../utils/amplify_utils.dart';

class TicketCategoryProvider with ChangeNotifier {
  Future<TicketCategory?> getTicketCategoryById(String id) async {
    try {
      final request = apiKeyRequest(
        ModelQueries.get(TicketCategory.classType, id),
      );
      final response = await Amplify.API.query(request: request).response;
      final ticketCategory = response.data;
      if (ticketCategory == null) {
        safePrint('errors: ${response.errors}');
        return null;
      }
      return ticketCategory;
    } on ApiException catch (e) {
      safePrint('Query failed: ${e.message}');
    }
    return null;
  }
}
