import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/cart_provider.dart';
import 'package:passi_app/providers/discount_code_provider.dart';
import 'package:passi_app/providers/payment_methods_by_user.dart';
import 'package:passi_app/providers/ticket_cateogories_by_event_provider.dart';

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

  Future<void> createTickets() async {
    if (cartProvider != null &&
        authenticationProvider != null &&
        eventProvider != null &&
        authenticationProvider?.user != null &&
        eventProvider?.event != null &&
        paymentMethodsByUserProvider != null &&
        paymentMethodsByUserProvider!.presignedAcceptance != null) {
      if (paymentMethodsByUserProvider!.presignedAcceptance!.acceptanceToken.isNotEmpty) {
        const createEntrance = 'createEntrance';
        const graphQLDocument =
            '''mutation CreateEntrance(\$eventID: ID!, \$ticketCategoriesID: ID!, \$code: String,   \$acceptanceToken: String!, \$installments: Int!) {
            $createEntrance(eventID: \$eventID, ticketCategoriesID: \$ticketCategoriesID, code: \$code, acceptanceToken: \$acceptanceToken, installments: \$installments) {
              data
            }''';

        final variables = {
          'eventID': eventProvider!.event!.id,
          'ticketCategoriesID': cartProvider!.transformCart,
          'code': discountCodesByEventProvider?.discountCode?.code,
          'acceptanceToken': paymentMethodsByUserProvider!.presignedAcceptance!.acceptanceToken,
          'installments': 1
        };
        print(variables);
        final createEntranceRequest = cognitoRequest(
          GraphQLRequest<CreateEntranceResponse>(
            document: graphQLDocument,
            variables: variables,
            decodePath: createEntrance,
          ),
        );

        final response = await Amplify.API.mutate(request: createEntranceRequest).response;
        print(response.data!.data);
      } else {
        print("Falta el acceptance Token");
      }
    } else {
      print("Falta todo lo demas");
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
          print('errors: ${response.errors}');
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
