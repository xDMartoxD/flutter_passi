import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scan_app/widgets/scan_widget.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const ScanWidget(),
      ),
    );
  }
}
