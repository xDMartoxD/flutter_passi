import 'package:flutter/material.dart';

import '../constants/paymentMethodsLogos.dart';
import '../models/PaymentMethod.dart';
import '../providers/authentication_provider.dart';

class PaymentMethodContent extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool? isLoading;
  final void Function(BuildContext, PaymentMethod)? onChangeHandler;
  final AuthenticationProvider? authenticationProvider;
  const PaymentMethodContent(
      {super.key,
      required this.paymentMethod,
      this.isLoading,
      this.onChangeHandler,
      this.authenticationProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              getPaymentMethodLogo(paymentMethod.type, paymentMethod.data.brand),
            ),
          ),
          title: Text(
            paymentMethod.data.name ?? paymentMethod.data.phone_number ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          trailing: isLoading != null
              ? isLoading!
                  ? const CircularProgressIndicator()
                  : Radio(
                      groupValue: authenticationProvider?.user?.userSelectedPaymentMethodId,
                      value: paymentMethod.id,
                      onChanged: (object) {
                        if (onChangeHandler != null) {
                          onChangeHandler!(context, paymentMethod);
                        }
                      },
                    )
              : null,
        ),
        isLoading != null ? const Divider() : Container()
      ],
    );
  }
}
