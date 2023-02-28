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
  final String? discountCode;
  EventCheckoutScreen({super.key, required this.id, this.discountCode});

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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: getColor("FF0000"),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Segunda Etapa",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: Colors.grey),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "50,000 COP",
                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                            textAlign: TextAlign.start,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.remove,
                                          size: 18,
                                        )),
                                    Text("1"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          size: 18,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Codigo de descuento",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Cambiar",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            // color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "MARTIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Metodo de pago",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Eliminar",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            // color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "MARTIN",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      )
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
