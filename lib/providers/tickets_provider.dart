import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/cart_provider.dart';
import 'package:passi_app/providers/ticket_cateogories_by_event_provider.dart';

import '../utils/amplify_utils.dart';
import 'event_provider.dart';

class TicketsProvider with ChangeNotifier {
  final AuthenticationProvider? authenticationProvider;
  final EventProvider? eventProvider;
  final CartProvider? cartProvider;
  final TicketCategoriesByEventProvider? ticketCategoriesProvider;
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => [..._tickets];
  List<Event> _events = [];
  List<Event> get events => [...events];
  TicketsProvider(
      {this.ticketCategoriesProvider,
      this.authenticationProvider,
      this.eventProvider,
      this.cartProvider});

  Future<void> createTickets() async {
    if (cartProvider != null &&
        authenticationProvider != null &&
        eventProvider != null &&
        authenticationProvider?.user != null &&
        eventProvider?.event != null) {
      try {
        for (var entry in cartProvider!.cart.entries) {
          final ticket = Ticket(
            event: eventProvider!.event!,
            ticketCategory: ticketCategoriesProvider!.ticketCategories
                .firstWhere((element) => element.id == entry.key),
            didAssist: false,
            user: authenticationProvider!.user!,
            createdAt: TemporalDateTime.now(),
            updatedAt: TemporalDateTime.now(),
          );
          final createTicketRequest = cognitoRequest(ModelMutations.create(ticket));

          final createPaymentMethodResponse = await Amplify.API
              .mutate(
                request: createTicketRequest,
              )
              .response;

          if (createPaymentMethodResponse.data == null) {
            safePrint("errors: ${createPaymentMethodResponse.errors}");
          }
        }
      } on Exception catch (_) {
        rethrow;
      }
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
            _fetchAndAddEvent(ticket.id);
          }
        }
        _tickets = loadedTickets;
        notifyListeners();
      } on ApiException catch (e) {
        safePrint('Query failed: $e');
      }
    }
  }

  Future<void> _fetchAndAddEvent(String ticketId) async {
    if (authenticationProvider != null && authenticationProvider?.user != null) {
      try {
        final request = cognitoRequest(
          ModelQueries.list(Event.classType, where: Event.TICKETS.contains(ticketId)),
        );
        final response = await Amplify.API.query(request: request).response;
        final paginatedEvents = response.data;
        if (paginatedEvents == null) {
          print('errors: ${response.errors}');
          return;
        }
        if (paginatedEvents.items[0] == null) {
          return;
        }
        _events.add(paginatedEvents.items[0]!);
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
  }
}
