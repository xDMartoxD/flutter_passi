import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../environment/environment.dart';

Future<String> validateTicket(
    {required String ticketId, required String eventId}) async {
  //Send post request to Environment url
  Response? response;
  try {
    response = await http.post(
      Uri.parse('${Environment().config.url}/validate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'eventID': eventId,
        'ticketId': ticketId,
      }),
    );
  } on Exception catch (e) {
    
    return "ERROR $e";
  }
  //If response is not 200, throw exception
  if (response.statusCode != 200) {
    throw Exception(response.body);
  }
  //Return response status code
  return response.body;
}
