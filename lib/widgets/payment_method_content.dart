import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/paymentMethodsLogos.dart';
import '../models/PaymentMethod.dart';
import '../providers/authentication_provider.dart';
import '../providers/payment_methods_by_user.dart';

class PaymentMethodContent extends StatefulWidget {
  final PaymentMethod paymentMethod;
  final bool showTrailing;
  const PaymentMethodContent({
    super.key,
    required this.paymentMethod,
    required this.showTrailing,
  });

  @override
  State<PaymentMethodContent> createState() => _PaymentMethodContentState();
}

class _PaymentMethodContentState extends State<PaymentMethodContent> {
  bool _isLoading = false;

  void onChangeHandler(BuildContext buildContext, PaymentMethod paymentMethod) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<PaymentMethodsByUserProvider>(context, listen: false)
          .changeUserSelectedPaymentMethod(paymentMethod);
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
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              getPaymentMethodLogo(widget.paymentMethod.type, widget.paymentMethod.data.brand),
            ),
          ),
          title: Text(
            widget.paymentMethod.data.name ?? widget.paymentMethod.data.phone_number ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          trailing: widget.showTrailing
              ? TrailingWidget(
                  paymentMethod: widget.paymentMethod,
                  onChangeHandler: onChangeHandler,
                  isLoading: _isLoading,
                )
              : Container(
                  width: 0,
                ),
        ),
        widget.showTrailing ? const Divider() : Container()
      ],
    );
  }
}

class TrailingWidget extends StatelessWidget {
  final bool isLoading;
  final PaymentMethod paymentMethod;
  final void Function(BuildContext, PaymentMethod) onChangeHandler;
  const TrailingWidget({
    super.key,
    required this.isLoading,
    required this.paymentMethod,
    required this.onChangeHandler,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : Consumer<AuthenticationProvider>(builder: (context, authenticationProvider, child) {
            return Radio(
                groupValue: authenticationProvider.user?.userSelectedPaymentMethodId,
                value: paymentMethod.id,
                onChanged: (_) => onChangeHandler(context, paymentMethod));
          });
  }
}
