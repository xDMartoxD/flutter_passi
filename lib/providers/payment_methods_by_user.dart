import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/utils/amplify_utils.dart';

class PaymentMehtodsByUserProvider with ChangeNotifier {
  final AuthenticationProvider? authenticationProvider;
  List<PaymentMethod> _paymentMethods = [];
  PaymentMethod? _userSelectedPaymentMethod;
  List<PaymentMethod> get paymentMethods {
    return [..._paymentMethods];
  }

  PaymentMethod? get userSelectedPaymentMethod => _userSelectedPaymentMethod;

  PaymentMehtodsByUserProvider({this.authenticationProvider});

  Future<void> getPaymentMethods() async {
    if (authenticationProvider == null || authenticationProvider?.user == null) {
      return;
    }
    try {
      final request = cognitoRequest(
        ModelQueries.list(
          PaymentMethod.classType,
          where: PaymentMethod.USER.eq(authenticationProvider!.user!.id),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paginatedPaymentMethods = response.data;
      if (paginatedPaymentMethods == null) {
        print('errors: ${response.errors}');
        return;
      }
      final List<PaymentMethod> loadedPaymentMethods = [];
      for (var element in paginatedPaymentMethods.items) {
        if (element != null) {
          loadedPaymentMethods.add(element);
        }
      }
      _paymentMethods = loadedPaymentMethods;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  Future<void> getUserSelectedPaymentMethod() async {
    if (authenticationProvider == null ||
        authenticationProvider?.user == null ||
        authenticationProvider?.user?.userSelectedPaymentMethodId == null) {
      return;
    }
    try {
      final request = cognitoRequest(
        ModelQueries.get(
          PaymentMethod.classType,
          authenticationProvider!.user!.userSelectedPaymentMethodId!,
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paymentMethod = response.data;
      if (paymentMethod == null) {
        print('errors: ${response.errors}');
        return;
      }

      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }
}
