import 'dart:convert';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/ticket_category_provider.dart';
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
  final TicketCategoryProvider? ticketCategoryProvider;
  List<Ticket?> _tickets = [];
  List<Ticket?> get tickets => [..._tickets];

  TicketsProvider({
    this.ticketCategoryProvider,
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
      if (paymentMethodsByUserProvider!
          .presignedAcceptance!.acceptanceToken.isNotEmpty) {
        try {
          final restOperation = Amplify.API.post(
            './create-entrance',
            body: HttpPayload.json(
              {
                "acceptanceToken": paymentMethodsByUserProvider!
                    .presignedAcceptance!.acceptanceToken,
                "installments": 1,
                "eventID": eventProvider!.eventId,
                "code": discountCodesByEventProvider?.discountCode?.code,
                "ticketCategoriesID": cartProvider!.transformCart,
                "userID": authenticationProvider!.user!.id
              },
            ),
          );
          final response = await restOperation.response;
          final body = json.decode(response.decodeBody());
          if (response.statusCode == 401) {
            return body["data"];
          }
          return null;
        } on ApiException catch (e) {
          return e.message;
        }
      } else {
        return "Falta el acceptance Token";
      }
    } else {
      return "ERROR FATAL";
    }
  }

  Future<void> getTickets() async {
    if (authenticationProvider != null &&
        authenticationProvider?.user != null &&
        eventProvider != null &&
        ticketCategoryProvider != null) {
      try {
        const ticketsByUser = 'ticketsByUser';
        String graphQLDocument = '''
query TicketsByUser(\$userID: ID!) {
  $ticketsByUser(userID: \$userID) {
    items {
      id
      code
      createdAt
      didAssist
      eventID
      inDateTime
      jobID
      outDateTime
      seat
      ticketCategoryID
      updatedAt
      userID
      eventID
      ticketCategoryID
    }
  }
}

''';

        final ticketsByUserRequest = cognitoRequest(
          GraphQLRequest(
            document: graphQLDocument,
            variables: <String, String>{
              'userID': authenticationProvider!.user!.id
            },
            decodePath: ticketsByUser,
          ),
        );
        final responseGraphQLDocument =
            await Amplify.API.query(request: ticketsByUserRequest).response;
        if (responseGraphQLDocument.data == null) {
          safePrint('errors: ${responseGraphQLDocument.errors}');
          return;
        }
        final data = jsonDecode(responseGraphQLDocument.data);
        final ticketsMap =
            List<Map<String, dynamic>>.from(data[ticketsByUser]['items']);
        List<Ticket?> loadedTickets = [];
        for (var ticketMap in ticketsMap) {
          final event = await eventProvider!.getEventById(ticketMap['eventID']);
          final ticketCategory = await ticketCategoryProvider!
              .getTicketCategoryById(ticketMap['ticketCategoryID']);
          final ticket = Ticket(
            user: authenticationProvider!.user,
            didAssist: ticketMap['didAssist'],
            event: event,
            id: ticketMap['id'],
            seat: ticketMap['seat'],
            ticketCategory: ticketCategory,
            createdAt: TemporalDateTime.fromString(ticketMap['createdAt']),
            updatedAt: TemporalDateTime.fromString(ticketMap['updatedAt']),
          );
          loadedTickets.add(ticket);
        }
        _tickets = loadedTickets;
        notifyListeners();
      } on ApiException catch (e) {
        safePrint('Query failed: $e');
      }
    }
  }
}
