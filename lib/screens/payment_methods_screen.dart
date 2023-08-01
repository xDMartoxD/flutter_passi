import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/ModelProvider.dart';
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
        title: const Text("Métodos de pago"),
      ),
      body: ChangeNotifierProxyProvider<AuthenticationProvider,
          PaymentMethodsByUserProvider>(
        create: (context) {
          return PaymentMethodsByUserProvider();
        },
        update: (context, auth, previous) {
          return PaymentMethodsByUserProvider(authenticationProvider: auth, paymentMethods: previous?.paymentMethods );
        },
        child: const PaymentMethodsContent(),
      ),
    );
  }
}

class PaymentMethodsContent extends StatelessWidget {
  const PaymentMethodsContent({super.key});

  Future<void> _fetchUserPaymentMethods(BuildContext context) async {
    await Provider.of<PaymentMethodsByUserProvider>(context, listen: false)
        .getPaymentMethods();
  }

  void _addPaymentMethodHandler({
    required BuildContext context,
  }) {
    showModalBottomSheet<dynamic>(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                onTap: () {
                  context.pushNamed(AddCardScreen.name);
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mastercard.png'),
                ),
                title: Text(
                  "Tarjeta débito/crédito con CVV",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
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
            return Consumer2<PaymentMethodsByUserProvider,
                AuthenticationProvider>(
              builder: (context, paymentMehtodsProvider, authenticationProvider,
                  child) {
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
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
                            _addPaymentMethodHandler(context: context),
                        child: Text(
                          "Agregar método de pago",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
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

class PaymentMethodsListWidget extends StatefulWidget {
  const PaymentMethodsListWidget({super.key});

  @override
  State<PaymentMethodsListWidget> createState() =>
      _PaymentMethodsListWidgetState();
}

class _PaymentMethodsListWidgetState extends State<PaymentMethodsListWidget> {
  late String? _selectedPaymentMethodId;
  bool didChange = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!didChange) {
      setState(() {
        _selectedPaymentMethodId = context
            .read<PaymentMethodsByUserProvider>()
            .selectedPaymentMethod
            ?.id;
      });
    }
  }

  void _onChangeHandler(PaymentMethod newSelectedPaymentMethod) async {
    setState(() {
      _selectedPaymentMethodId = newSelectedPaymentMethod.id;
    });
    context
            .read<PaymentMethodsByUserProvider>().changeUserSelectedPaymentMethod(newSelectedPaymentMethod);


  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenticationProvider, PaymentMethodsByUserProvider>(
        builder:
            (context, authenticationProvider, paymentMethodsProvider, child) {
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
              return Dismissible(
                onDismissed: (direction) async {
                  await paymentMethodsProvider
                      .removeUserPaymentMethod(paymentMethod);
                },
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.red,
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
                key: Key(paymentMethod.id),
                child: PaymentMethodContent(
                  paymentMethod: paymentMethod,
                  showTrailing: true,
                  selectedPaymentMethodId: _selectedPaymentMethodId,
                  onChangeHandler: _onChangeHandler,
                ),
              );
            },
          ).toList()
        ]),
      );
    });
  }
}
