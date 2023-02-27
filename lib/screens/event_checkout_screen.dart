import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/event_provider.dart';
import 'package:passi_app/utils/flutter_utils.dart';
import 'package:passi_app/widgets/event_item_large.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../providers/ticket_cateogories_by_event_provider.dart';

class EventCheckoutScreen extends StatelessWidget {
  static const path = "event-checkout/:id";
  static const name = "event-checkout";
  final String id;
  EventCheckoutScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => TicketCategoriesByEventProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
      ], child: EventCheckoutContent(id: id)),
    );
  }
}

class EventCheckoutContent extends StatelessWidget {
  final String id;
  const EventCheckoutContent({super.key, required this.id});

  Future<void> _fetchCheckoutInfo(BuildContext context) async {
    try {
      await Provider.of<EventProvider>(context, listen: false).setEventById(id);
      await Provider.of<TicketCategoriesByEventProvider>(
        context,
        listen: false,
      ).fetchTicketCategoriesByEventId(id);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchCheckoutInfo(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Consumer3<EventProvider, TicketCategoriesByEventProvider,
                AuthenticationProvider>(
              builder: (
                context,
                eventProvider,
                ticketCategoriesProvider,
                authProvider,
                child,
              ) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      if (eventProvider.event != null)
                        IgnorePointer(
                          child: EventItemLarge(
                            id: eventProvider.event!.id,
                            imageUrl: eventProvider.event!.primaryImage,
                            title: eventProvider.event!.title,
                            address: eventProvider.event!.address,
                            price: eventProvider.event!.price,
                            date: eventProvider.event!.startDateTime,
                          ),
                        ),
                      Column(children: [
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: getColor("FF0000"),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Segunda Etapa",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "50,000 COP",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.start,
                                )
                              ],
                            )
                          ],
                        ),
                        Divider()
                      ])
                    ],
                  ),
                );
              },
            );
          default:
            return Loading();
        }
      },
    );
  }
}
