import 'dart:convert';
import 'dart:typed_data';

import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import '../providers/authentication_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/discount_code_provider.dart';
import '../providers/payment_methods_by_user.dart';
import '../providers/ticket_cateogories_by_event_provider.dart';

import '../utils/amplify_utils.dart';
import 'event_provider.dart';

class TicketsProvider with ChangeNotifier {
  final AuthenticationProvider? authenticationProvider;
  final EventProvider? eventProvider;
  final CartProvider? cartProvider;
  final TicketCategoriesByEventProvider? ticketCategoriesProvider;
  final PaymentMethodsByUserProvider? paymentMethodsByUserProvider;
  final DiscountCodesByEventProvider? discountCodesByEventProvider;
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => [..._tickets];

  TicketsProvider({
    this.discountCodesByEventProvider,
    this.ticketCategoriesProvider,
    this.authenticationProvider,
    this.eventProvider,
    this.cartProvider,
    this.paymentMethodsByUserProvider,
  });

  Future<String?> createTickets() async {
    if (cartProvider != null &&
        authenticationProvider != null &&
        eventProvider != null &&
        authenticationProvider?.user != null &&
        eventProvider?.event != null &&
        paymentMethodsByUserProvider != null &&
        paymentMethodsByUserProvider!.presignedAcceptance != null) {
      if (paymentMethodsByUserProvider!.presignedAcceptance!.acceptanceToken.isNotEmpty) {
        try {
          final options = RestOptions(
            path: '/create-entrance',
            body: Uint8List.fromList(
                "{\"acceptanceToken\":\"${paymentMethodsByUserProvider!.presignedAcceptance!.acceptanceToken}\", \"installments\": 1 ,\"eventID\": \"${eventProvider!.event!.id}\",  \"code\": \"${discountCodesByEventProvider?.discountCode?.code}\", \"ticketCategoriesID\": ${cartProvider!.transformCart}, \"userID\":\"${authenticationProvider!.user!.id}\"}"
                    .codeUnits),
          );
          final response = await Amplify.API.post(restOptions: options).response;
          final body = json.decode(response.body);
          if (response.statusCode == 401) {
            return body["data"];
          }
          return null;
        } on ApiException catch (e) {
          safePrint('POST call failed: $e');
          rethrow;
        }
      } else {
        return "Falta el acceptance Token";
      }
    } else {
      return "ERROR FATAL";
    }
  }

  Future<void> getTickets() async {
    if (authenticationProvider != null && authenticationProvider?.user != null) {
      try {
        final request = cognitoRequest(
          ModelQueries.list(Ticket.classType,
              where: Ticket.USER.eq(authenticationProvider!.user!.id)),
        );
        final response = await Amplify.API.query(request: request).response;
        final paginatedEventCategories = response.data;
        if (paginatedEventCategories == null) {
          safePrint('errors: ${response.errors}');
          return;
        }

        final List<Ticket> loadedTickets = [];
        for (var ticket in paginatedEventCategories.items) {
          if (ticket != null) {
            loadedTickets.add(ticket);
          }
        }
        _tickets = loadedTickets;
        notifyListeners();
      } on ApiException catch (e) {
        safePrint('Query failed: $e');
      }
    }
  }
}
