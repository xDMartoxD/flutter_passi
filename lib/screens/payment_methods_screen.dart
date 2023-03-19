import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/payment_methods_by_user.dart';
import 'package:passi_app/screens/add_card_screen.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../widgets/payment_method_content.dart';
// import 'add_nequi_screen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  static const path = "payment-methods";
  static const name = "payment-methods";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Metodos de pago"),
      ),
      body: ChangeNotifierProxyProvider<AuthenticationProvider, PaymentMethodsByUserProvider>(
        create: (context) {
          return PaymentMethodsByUserProvider();
        },
        update: (context, auth, previous) {
          return PaymentMethodsByUserProvider(authenticationProvider: auth);
        },
        child: PaymentMethodsContent(
          scaffoldKey: _scaffoldKey,
        ),
      ),
    );
  }
}

class PaymentMethodsContent extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const PaymentMethodsContent({super.key, required this.scaffoldKey});

  Future<void> _fetchUserPaymentMethods(BuildContext context) async {
    await Provider.of<PaymentMethodsByUserProvider>(context, listen: false).getPaymentMethods();
  }

  Future<dynamic> _addPaymentMethodHandler(BuildContext context) {
    return showModalBottomSheet<dynamic>(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (cotext) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: Theme.of(context).cardColor,
            ),
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    if (context.mounted) {
                      context.pushNamed(AddCardScreen.name);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/mastercard.png'),
                    ),
                    title: Text("Tarjeta"),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     if (context.mounted) {
                //       context.pushNamed(AddNequiScreen.name);
                //     }
                //   },
                //   child: const ListTile(
                //     leading: CircleAvatar(
                //       backgroundImage: AssetImage('assets/images/nequi.png'),
                //     ),
                //     title: Text('Nequi'),
                //   ),
                // )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchUserPaymentMethods(context),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Consumer2<PaymentMethodsByUserProvider, AuthenticationProvider>(
              builder: (context, paymentMehtodsProvider, authenticationProvider, child) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      paymentMehtodsProvider.paymentMethods.isEmpty
                          ? Text(
                              "Agrega tu primer metodo de pago",
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            )
                          : const PaymentMethodsListWidget(),
                      const SizedBox(
                        height: 15,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () =>
                            _addPaymentMethodHandler(scaffoldKey.currentContext ?? context),
                        child: Text(
                          "Agregar metodo de pago",
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
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

class PaymentMethodsListWidget extends StatelessWidget {
  const PaymentMethodsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenticationProvider, PaymentMethodsByUserProvider>(
        builder: (context, authenticationProvider, paymentMethodsProvider, child) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          ...paymentMethodsProvider.paymentMethods.map(
            (paymentMethod) {
              return PaymentMethodContent(
                paymentMethod: paymentMethod,
                showTrailing: true,
              );
            },
          ).toList()
        ]),
      );
    });
  }
}
