import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/event_provider.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../providers/ticket_cateogories_by_event_provider.dart';

class EventCheckoutScreen extends StatefulWidget {
  static const path = "event-checkout/:id";
  static const name = "event-checkout";
  final String id;
  EventCheckoutScreen({super.key, required this.id});

  @override
  State<EventCheckoutScreen> createState() => _EventCheckoutScreenState();
}

class _EventCheckoutScreenState extends State<EventCheckoutScreen> {
  Future<void> _fetchCheckoutInfo(BuildContext context) async {
    Provider.of<EventProvider>(context, listen: false).setEventById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _fetchCheckoutInfo(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return CheckoutContent();
            default:
              return Loading();
          }
        },
      ),
    );
  }
}

class CheckoutContent extends StatelessWidget {
  const CheckoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<EventProvider, TicketCategoriesByEventProvider>(
      builder: (context, eventProvider, ticketCategoriesProvider, child) {
        return Container();
      },
    );
  }
}
