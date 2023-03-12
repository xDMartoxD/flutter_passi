import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:passi_app/constants/paymentMethodsLogos.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/payment_methods_by_user.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../models/PaymentMethod.dart';

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
      body: ChangeNotifierProxyProvider<AuthenticationProvider, PaymentMehtodsByUserProvider>(
        create: (context) {
          return PaymentMehtodsByUserProvider();
        },
        update: (context, auth, previous) {
          return PaymentMehtodsByUserProvider(authenticationProvider: auth);
        },
        child: PaymentMethodsContent(),
      ),
    );
  }
}

class PaymentMethodsContent extends StatelessWidget {
  const PaymentMethodsContent({
    super.key,
  });
  Future<void> _fethPaymentMehtods(BuildContext context) async {
    await Provider.of<PaymentMehtodsByUserProvider>(context).getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fethPaymentMehtods(context),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return Consumer<PaymentMehtodsByUserProvider>(
              builder: (context, paymentMehtodsProvider, child) {
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
                              paymentMethods: paymentMehtodsProvider.paymentMethods),
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
        context: context,
        builder: (cotext) {
          return Column(
            children: [
              GestureDetector(
                child: ListTile(),
              )
            ],
          );
        });
  }
}

class PaymentMethodsListWidget extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  const PaymentMethodsListWidget({super.key, required this.paymentMethods});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...paymentMethods
            .map((pm) => ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(getPaymentMethodLogo(pm.type, pm.data.brand))),
                ))
            .toList()
      ],
    );
  }
}
