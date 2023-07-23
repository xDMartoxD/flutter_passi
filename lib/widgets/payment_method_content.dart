import 'package:flutter/material.dart';
import '../constants/paymentMethodsLogos.dart';
import '../models/PaymentMethod.dart';

class PaymentMethodContent extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool showTrailing;
  final String? selectedPaymentMethodId;
  final void Function(PaymentMethod)? onChangeHandler;
  const PaymentMethodContent({
    super.key,
    required this.paymentMethod,
    required this.showTrailing,
    this.selectedPaymentMethodId,
    this.onChangeHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              getPaymentMethodLogo(
                  paymentMethod.type, paymentMethod.data.brand),
            ),
          ),
          title: Text(
            paymentMethod.data.name ?? paymentMethod.data.phone_number ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          trailing: showTrailing
              ? TrailingWidget(
                  paymentMethod: paymentMethod,
                  onChangeHandler: onChangeHandler!,
                  selectedPaymentMethodId: selectedPaymentMethodId,
                )
              : Container(
                  width: 0,
                ),
        ),
        showTrailing ? const Divider() : Container()
      ],
    );
  }
}

class TrailingWidget extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final String? selectedPaymentMethodId;
  final void Function(PaymentMethod) onChangeHandler;
  const TrailingWidget({
    super.key,
    required this.paymentMethod,
    required this.onChangeHandler,
    required this.selectedPaymentMethodId,
  });

  @override
  Widget build(BuildContext context) {
    return Radio(
        groupValue: selectedPaymentMethodId,
        value: paymentMethod.id,
        onChanged: (_) => onChangeHandler(paymentMethod));
  }
}
