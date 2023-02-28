import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/cart_provider.dart';
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

class EventCheckoutContent extends StatefulWidget {
  final String id;
  const EventCheckoutContent({super.key, required this.id});

  @override
  State<EventCheckoutContent> createState() => _EventCheckoutContentState();
}

class _EventCheckoutContentState extends State<EventCheckoutContent> {
  TicketCategoriesByEventProvider? _ticketCategoriesByEventProvider;

  Future<void> _fetchCheckoutInfo(BuildContext context) async {
    try {
      await Provider.of<EventProvider>(context, listen: false).setEventById(widget.id);

      _ticketCategoriesByEventProvider = Provider.of<TicketCategoriesByEventProvider>(
        context,
        listen: false,
      );
      await _ticketCategoriesByEventProvider!.fetchTicketCategoriesByEventId(widget.id);
    } catch (e) {
      safePrint(e.toString());
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
                              ...ticketCategoriesProvider.ticketCategories.map(
                                (ticketCategory) {
                                  return ChangeNotifierProvider(
                                    create: (context) {
                                      return CartProvider(ticketCategory: ticketCategory);
                                    },
                                    child: TicketCategoryContentWidget(
                                      color: ticketCategory.color,
                                      name: ticketCategory.name,
                                      price: ticketCategory.price,
                                    ),
                                  );
                                },
                              ).toList()
                            ],
                          )),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text.rich(
                          TextSpan(
                            text: "He leido y acepto los ",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: "Terminos y condiciones ",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Color.fromRGBO(26, 135, 244, 1),
                                    ),
                                recognizer: TapGestureRecognizer()..onTap = () {},
                              ),
                              TextSpan(
                                text: "y las politicas de privacidad para hacer esta compra",
                                style: Theme.of(context).textTheme.bodyMedium,
                              )
                            ],
                          ),
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

class TicketCategoryContentWidget extends StatelessWidget {
  final String color;
  final String name;
  final double price;

  const TicketCategoryContentWidget({
    super.key,
    required this.color,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${formatNumber(price)} COP",
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
            addTicketToCartWidget()
          ],
        ),
        Divider()
      ],
    );
  }
}

class addTicketToCartWidget extends StatelessWidget {
  const addTicketToCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Row(
          children: [
            IconButton(
                onPressed: cartProvider.remove,
                icon: Icon(
                  Icons.remove,
                  size: 18,
                )),
            Text(cartProvider.quantity.toString()),
            IconButton(
                onPressed: cartProvider.add,
                icon: Icon(
                  Icons.add,
                  size: 18,
                )),
          ],
        );
      },
    );
  }
}
