import 'package:flutter/material.dart';

class EventCheckoutScreen extends StatefulWidget {
  static const route = "event-checkout/:id";
  static const name = "event-checkout";
  final String id;
  const EventCheckoutScreen({super.key, required this.id});

  @override
  State<EventCheckoutScreen> createState() => _EventCheckoutScreenState();
}

class _EventCheckoutScreenState extends State<EventCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const Placeholder());
  }
}
