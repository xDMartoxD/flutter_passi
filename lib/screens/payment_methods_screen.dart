import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/constants/paymentMethodsLogos.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/payment_methods_by_user.dart';
import 'package:passi_app/screens/add_card_screen.dart';
// import 'package:passi_app/screens/add_nequi_screen.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../models/PaymentMethod.dart';
import '../widgets/payment_method_content.dart';

class PaymentMethodsScreen extends StatefulWidget {
  static const path = "payment-methods";
  static const name = "payment-methods";
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Metodos de pago"),
      ),
      body: ChangeNotifierProxyProvider<AuthenticationProvider, PaymentMethodsByUserProvider>(
        create: (context) {
          return PaymentMethodsByUserProvider();
        },
        update: (context, auth, previous) {
          return PaymentMethodsByUserProvider(authenticationProvider: auth);
        },
        child: PaymentMethodsContent(),
      ),
    );
  }
}

class PaymentMethodsContent extends StatefulWidget {
  const PaymentMethodsContent({
    super.key,
  });

  @override
  State<PaymentMethodsContent> createState() => _PaymentMethodsContentState();
}

class _PaymentMethodsContentState extends State<PaymentMethodsContent> {
  Future<void> _fetchUserPaymentMethods(BuildContext context) async {
    await Provider.of<PaymentMethodsByUserProvider>(context, listen: false).getPaymentMethods();
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
                  padding: EdgeInsets.all(15),
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
                          : PaymentMethodsListWidget(
                              paymentMethodsProvider: paymentMehtodsProvider,
                              authenticationProvider: authenticationProvider,
                            ),
                      SizedBox(
                        height: 15,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () => _addPaymentMethodHandler(context),
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
            return Loading();
        }
      },
    );
  }

  void _addPaymentMethodHandler(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (cotext) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: Theme.of(context).cardColor,
            ),
            child: Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    context.pushNamed(AddCardScreen.name);
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
                //     Navigator.of(context).pop();
                //     context.pushNamed(AddNequiScreen.name);
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
}

class PaymentMethodsListWidget extends StatefulWidget {
  final PaymentMethodsByUserProvider paymentMethodsProvider;
  final AuthenticationProvider authenticationProvider;
  const PaymentMethodsListWidget(
      {super.key, required this.paymentMethodsProvider, required this.authenticationProvider});

  @override
  State<PaymentMethodsListWidget> createState() => _PaymentMethodsListWidgetState();
}

class _PaymentMethodsListWidgetState extends State<PaymentMethodsListWidget> {
  bool _isLoading = false;
  void onChangeHandler(BuildContext buildContext, PaymentMethod paymentMethod) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await widget.paymentMethodsProvider.changeUserSelectedPaymentMethod(paymentMethod);
    } on Exception catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(builder: (context, authenticationProvider, child) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Column(children: [
          ...widget.paymentMethodsProvider.paymentMethods
              .map((paymentMethod) => PaymentMethodContent(
                  paymentMethod: paymentMethod,
                  isLoading: _isLoading,
                  onChangeHandler: onChangeHandler,
                  authenticationProvider: authenticationProvider))
              .toList()
        ]),
      );
    });
  }
}
