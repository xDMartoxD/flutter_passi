import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scan_app/services/validate_ticket_service.dart';

import '../providers/event_provider.dart';
import './scan_screen.dart';

class AnswerScreen extends StatefulWidget {
  String value;
  AnswerScreen({super.key, required this.value});

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  int valid = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ScanScreen(),
                  settings: const RouteSettings(name: "/scan"))),
        ),
      ),
      body: FutureBuilder<String>(
        future: validateTicket(
            ticketId: widget.value, eventId: context.read<EventState>().event),
        initialData: "Loading...",
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Result: ${snapshot.data}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
