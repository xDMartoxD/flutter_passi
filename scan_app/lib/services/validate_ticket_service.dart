import 'dart:convert';

import 'package:http/http.dart' as http;

import '../environment/environment.dart';

Future<String> ValidateTicket(String ticketId, String eventId) async {
  //Send post request to Environment url
  final response = await http.post(
    Uri.parse('${Environment().config.url}/validate'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'eventID': eventId,
      'ticketId': ticketId,
    }),
  );
  //If response is not 200, throw exception
  if (response.statusCode != 200) {
    return "ERROR";
  }
  //Return response status code
  return response.body;
}
