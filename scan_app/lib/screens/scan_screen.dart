import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_app/widgets/scan_widget.dart';

import '../providers/event_provider.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.read<EventState>().name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const ScanWidget(),
    );
  }
}
