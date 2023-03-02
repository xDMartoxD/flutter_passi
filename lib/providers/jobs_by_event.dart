import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/event_provider.dart';

class JobsByEventProvider with ChangeNotifier {
  EventProvider? eventProvider;
  List<Job> _jobs = [];

  JobsByEventProvider({this.eventProvider});
  List<Job> get jobs => [..._jobs];

  Future<void> getPromotersByEvent() async {
    if (eventProvider == null) {
      return;
    }
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
  }
}
