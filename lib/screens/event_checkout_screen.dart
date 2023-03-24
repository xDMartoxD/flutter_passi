import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/DiscountCode.dart';
import 'package:passi_app/models/screen_args/errors_screen_args.dart';
import 'package:passi_app/screens/errors_screen.dart';
import 'package:passi_app/screens/success_screen.dart';
import '../providers/discount_code_provider.dart';
import '../providers/tickets_provider.dart';
import '../screens/payment_methods_screen.dart';
import '../widgets/payment_method_content.dart';
import 'package:provider/provider.dart';
import '../providers/authentication_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/event_provider.dart';
import '../providers/payment_methods_by_user.dart';
import '../utils/flutter_utils.dart';
import '../widgets/event_item_large.dart';
import '../widgets/loading.dart';
import '../providers/ticket_cateogories_by_event_provider.dart';

class EventCheckoutScreen extends StatelessWidget {
  static const path = "event-checkout/:id";
  static const name = "event-checkout";
  final String id;
  final String? discountCode;
  const EventCheckoutScreen({super.key, required this.id, this.discountCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("checkout")),
      body: MultiProvider(providers: [
        ChangeNotifierProvider<TicketCategoriesByEventProvider>(
          create: (context) => TicketCategoriesByEventProvider(),
        ),
        ChangeNotifierProvider<EventProvider>(
          create: (context) => EventProvider(eventId: id),
        ),
        ChangeNotifierProxyProvider<AuthenticationProvider, PaymentMethodsByUserProvider>(
          create: (context) {
            return PaymentMethodsByUserProvider();
          },
          update: (context, auth, previous) {
            return PaymentMethodsByUserProvider(authenticationProvider: auth);
          },
        ),
        ChangeNotifierProxyProvider<TicketCategoriesByEventProvider, CartProvider>(
          create: (context) {
            return CartProvider();
          },
          update: (context, ticketCategoryProvider, previous) {
            return CartProvider(ticketCategoriesByEventProvider: ticketCategoryProvider);
          },
        ),
        ChangeNotifierProxyProvider<EventProvider, DiscountCodesByEventProvider>(
          create: (context) {
            return DiscountCodesByEventProvider();
          },
          update: (context, eventProvider, prev) {
            return DiscountCodesByEventProvider(eventProvider: eventProvider);
          },
        ),
        ChangeNotifierProxyProvider6<
            EventProvider,
            AuthenticationProvider,
            CartProvider,
            TicketCategoriesByEventProvider,
            PaymentMethodsByUserProvider,
            DiscountCodesByEventProvider,
            TicketsProvider>(
          create: (context) {
            return TicketsProvider();
          },
          update: (context,
              eventProvider,
              authenticationProvider,
              cartProvider,
              ticketCategoriesByEventProvider,
              paymentMethodsByUserProvider,
              discountCodesByEventProvider,
              prev) {
            return TicketsProvider(
              eventProvider: eventProvider,
              authenticationProvider: authenticationProvider,
              cartProvider: cartProvider,
              ticketCategoriesProvider: ticketCategoriesByEventProvider,
              paymentMethodsByUserProvider: paymentMethodsByUserProvider,
              discountCodesByEventProvider: discountCodesByEventProvider,
            );
          },
        )
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
  double totalAmount = 0;
  bool _isLoading = false;

  Future<void> _fetchCheckoutInfo(BuildContext context) async {
    try {
      if (context.mounted) {
        await Provider.of<EventProvider>(context, listen: false).setEvent();
      }
      if (context.mounted) {
        _ticketCategoriesByEventProvider = Provider.of<TicketCategoriesByEventProvider>(
          context,
          listen: false,
        );
        await _ticketCategoriesByEventProvider!.fetchTicketCategoriesByEventId(widget.id);
      }
      if (context.mounted) {
        final paymentMethodsProvider =
            Provider.of<PaymentMethodsByUserProvider>(context, listen: false);
        await paymentMethodsProvider.fetchTermsAndConditions();
        await paymentMethodsProvider.getPaymentMethods();
      }
      if (context.mounted) {
        await Provider.of<DiscountCodesByEventProvider>(
          context,
          listen: false,
        ).fetchDiscountCodes();
      }
    } catch (e) {
      safePrint(e.toString());
    }
  }

  Future<void> _buyTicketsHandler(
      AuthenticationProvider authProvider,
      CartProvider cartProvider,
      EventProvider eventProvider,
      DiscountCodesByEventProvider discountCodesByEventProvider) async {
    if (authProvider.user == null) {
      errorMessage(context, "Se necesita un usuario");
      return;
    }
    if ((authProvider.user!.userSelectedPaymentMethodId == null ||
            authProvider.user!.userSelectedPaymentMethodId!.isEmpty) &&
        cartProvider.total == 0) {
      errorMessage(context,
          "Se necesita un metodo de pago seleccionado para las entradas que tienen un costo");
      return;
    }
    if (eventProvider.event == null) {
      errorMessage(context, "No hay un evento existente");
      return;
    }
    if (eventProvider.event!.finishDateTime.compareTo(TemporalDateTime.now()) < 0) {
      errorMessage(context, "el evento ya ocurrio");
      return;
    }
    if (discountCodesByEventProvider.discountCode != null) {
      if (discountCodesByEventProvider.discountCode!.maxUse != null) {
        if (discountCodesByEventProvider.discountCode!.maxUse! <=
            discountCodesByEventProvider.discountCode!.actualUse) {
          errorMessage(context, "el codifo de descuento ya no es valido");
          return;
        }
      }
      if (discountCodesByEventProvider.discountCode!.validUntil.compareTo(TemporalDateTime.now()) <
          0) {
        errorMessage(context, "El codigo ya no es valido");
        return;
      }
    }
    try {
      setState(() {
        _isLoading = true;
      });
      final error = await Provider.of<TicketsProvider>(context, listen: false).createTickets();
      if (error == null) {
        if (context.mounted) {
          context.pushNamed(SuccessScreen.name);
        }
      } else {
        final params = ErrorsScreenArgs(error: error);
        if (context.mounted) {
          context.pushNamed(ErrorsScreen.name, queryParams: params.queryParams());
        }
      }
    } catch (e) {
      errorMessage(context, e.toString());
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchCheckoutInfo(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Consumer6<EventProvider, TicketCategoriesByEventProvider, AuthenticationProvider,
                DiscountCodesByEventProvider, PaymentMethodsByUserProvider, CartProvider>(
              builder: (
                context,
                eventProvider,
                ticketCategoriesProvider,
                authProvider,
                discountCodeProvider,
                paymentMethodsProvider,
                cartProvider,
                child,
              ) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              ...ticketCategoriesProvider.ticketCategories.map(
                                (ticketCategory) {
                                  return TicketCategoryContentWidget(
                                      color: ticketCategory.color,
                                      name: ticketCategory.name,
                                      price: ticketCategory.price,
                                      id: ticketCategory.id);
                                },
                              ).toList()
                            ],
                          )),
                      cartProvider.total > 0 ? const DiscountCodeWidget() : Container(),
                      cartProvider.total > 0
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).cardColor,
                              ),
                              margin: const EdgeInsets.all(15),
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: const SelectedPaymentMethodContent(),
                            )
                          : Container(),
                      eventProvider.event!.price > 0
                          ? const TermsAndConditionsWidget()
                          : Container(),
                      if (cartProvider.hasTickets)
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: !_isLoading
                                ? () => _buyTicketsHandler(
                                      authProvider,
                                      cartProvider,
                                      eventProvider,
                                      discountCodeProvider,
                                    )
                                : null,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const BuyButtonChild(),
                          ),
                        )
                    ],
                  ),
                );
              },
            );
          default:
            return const Loading();
        }
      },
    );
  }
}

class SelectedPaymentMethodContent extends StatelessWidget {
  const SelectedPaymentMethodContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodsByUserProvider>(
      builder: (context, paymentMethodsProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Metodo de pago",
                  style:
                      Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(PaymentMethodsScreen.name);
                  },
                  child: Text(
                    "Cambiar",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          // color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            paymentMethodsProvider.selectedPaymentMethod != null
                ? PaymentMethodContent(
                    paymentMethod: paymentMethodsProvider.selectedPaymentMethod!,
                    showTrailing: false,
                  )
                : Container()
          ],
        );
      },
    );
  }
}

class BuyButtonChild extends StatelessWidget {
  const BuyButtonChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<CartProvider, DiscountCodesByEventProvider>(
      builder: (context, cartProvider, discountCodesProvider, child) {
        return discountCodesProvider.discountCode != null
            ? Text.rich(
                TextSpan(
                    text: formatNumber(cartProvider.total),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black,
                          decorationThickness: 5,
                        ),
                    children: [
                      TextSpan(
                        text:
                            " ${formatNumber(cartProvider.total - discountCodesProvider.discountCode!.discount)} COP",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ]),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            : Text(
                cartProvider.total > 0 ? "${formatNumber(cartProvider.total)} COP" : "Gratis",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              );
      },
    );
  }
}

class DiscountCodeWidget extends StatefulWidget {
  const DiscountCodeWidget({
    super.key,
  });

  @override
  State<DiscountCodeWidget> createState() => _DiscountCodeWidgetState();
}

class _DiscountCodeWidgetState extends State<DiscountCodeWidget> {
  late final TextEditingController _textFieldControler;
  @override
  void initState() {
    super.initState();
    _textFieldControler = TextEditingController();
  }

  Future<void> _addDiscountCodeHandler(BuildContext context,
      DiscountCodesByEventProvider discountCodeProvider, EventProvider eventProvider) async {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).cardColor,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              color: Theme.of(context).cardColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _textFieldControler,
                  decoration: const InputDecoration(labelText: "Codigo"),
                ),
                TextButton(
                    onPressed: () {
                      discountCodeProvider.setDiscountCode(_textFieldControler.text);
                      Navigator.of(context).pop();
                    },
                    child: const Text("Buscar"))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DiscountCodesByEventProvider, EventProvider>(
      builder: (context, discountCodeProvider, eventProvider, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
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
                      onPressed: () {
                        if (discountCodeProvider.discountCode != null) {
                          discountCodeProvider.removeDiscountCode();
                        } else {
                          _addDiscountCodeHandler(context, discountCodeProvider, eventProvider);
                        }
                      },
                      child: Text(
                        discountCodeProvider.discountCode != null ? "Eliminar" : "Agregar",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              // color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              if (discountCodeProvider.discountCode != null)
                Text(
                  discountCodeProvider.discountCode!.code,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        );
      },
    );
  }
}

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  State<TermsAndConditionsWidget> createState() => _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodsByUserProvider>(
      builder: (context, wompiProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: "He leido y acepto los ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "Terminos y condiciones ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color.fromRGBO(26, 135, 244, 1),
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          wompiProvider.launchLink();
                        },
                    ),
                    TextSpan(
                      text: "y las politicas de privacidad para hacer esta compra.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              Checkbox(
                  value: wompiProvider.isChecked,
                  onChanged: (value) {
                    wompiProvider.toggleIsChecked(value ?? false);
                  })
            ],
          ),
        );
      },
    );
  }
}

class TicketCategoryContentWidget extends StatelessWidget {
  final String color;
  final String name;
  final double price;
  final String id;

  const TicketCategoryContentWidget({
    super.key,
    required this.id,
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
                    color: getColor(color),
                  ),
                ),
                const SizedBox(width: 5),
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
                      const SizedBox(height: 2),
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
            AddTicketToCartWidget(ticketCategoryId: id)
          ],
        ),
        const Divider()
      ],
    );
  }
}

class AddTicketToCartWidget extends StatelessWidget {
  final String ticketCategoryId;
  const AddTicketToCartWidget({
    required this.ticketCategoryId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Row(
          children: [
            IconButton(
                onPressed: () => cartProvider.remove(ticketCategoryId),
                icon: const Icon(
                  Icons.remove,
                  size: 18,
                )),
            Text(cartProvider.cart[ticketCategoryId].toString()),
            IconButton(
                onPressed: () => cartProvider.add(ticketCategoryId),
                icon: const Icon(
                  Icons.add,
                  size: 18,
                )),
          ],
        );
      },
    );
  }
}
