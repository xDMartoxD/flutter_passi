import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/PaymentMethod.dart';
import '../utils/amplify_utils.dart';

class UserPaymentMethods with ChangeNotifier {
  List<PaymentMethod> _paymentMethods = [];

  bool _hasNextResult = false;

  GraphQLRequest<PaginatedResult<PaymentMethod>>? _requestForNextToken;

  List<PaymentMethod> get paymentMehods {
    return [..._paymentMethods];
  }

  Future<void> getPaymentMehtods(String userId) async {
    try {
      final request = cognitoRequest(
        ModelQueries.list(
          PaymentMethod.classType,
          where: PaymentMethod.USER.eq(userId),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paginatedPaymentMethods = response.data;
      if (paginatedPaymentMethods == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      _hasNextResult = paginatedPaymentMethods.hasNextResult;
      _requestForNextToken = paginatedPaymentMethods.requestForNextResult;
      final List<PaymentMethod> loadedPaymentMethods = [];
      for (var element in paginatedPaymentMethods.items) {
        if (element != null) {
          loadedPaymentMethods.add(element);
        }
      }
      _paymentMethods = loadedPaymentMethods;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: ${e.message}');
    }
  }
}
