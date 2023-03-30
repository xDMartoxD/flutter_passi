import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  static const path = 'success';
  static const name = 'success';
  final String title;
  final String? message;
  const SuccessScreen({super.key, this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 48,
                color: Colors.green,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              message != null
                  ? Text(
                      message!,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    )
                  : Container()
            ]),
      ),
    );
  }
}
