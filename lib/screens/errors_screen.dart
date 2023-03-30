import 'package:flutter/material.dart';

class ErrorsScreen extends StatelessWidget {
  static const path = 'errors';
  static const name = 'errors';
  final String error;
  const ErrorsScreen({super.key, required this.error});

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
                Icons.warning_amber_rounded,
                size: 48,
                color: Colors.red,
              ),
              Text(
                "Ocurrio un error",
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                error,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              )
            ]),
      ),
    );
  }
}
