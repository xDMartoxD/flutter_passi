import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_app/providers/event_provider.dart';
import 'package:scan_app/screens/scan_screen.dart';

class EventSetter extends StatefulWidget {
  const EventSetter({super.key});

  @override
  State<EventSetter> createState() => _EventSetterState();
}

class _EventSetterState extends State<EventSetter> {
  final _formKey = GlobalKey<FormState>();
  final _eventFormController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _eventFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _eventFormController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<EventState>(context, listen: false).event =
                          _eventFormController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: const RouteSettings(name: "/scan"),
                          builder: (context) {
                            return const ScanScreen();
                          },
                        ),
                      );
                    },
                    child: Text("Aceptar"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
