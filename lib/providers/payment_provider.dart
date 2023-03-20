import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:passi_app/models/my_models/presigned_acceptance.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/PresignedAcceptance.dart';
import '../utils/amplify_utils.dart';

class PaymentProvider with ChangeNotifier {
  PresignedAcceptanceModel? cardToken;
  bool _isChecked = false;
  PresignedAcceptanceModel? get presignedAcceptance {
    return cardToken;
  }

  bool get isChecked {
    return _isChecked;
  }

  Future<void> fetchTermsAndConditions() async {
    try {
      final uri = Uri.https(
          "production.wompi.co", "/v1/merchants/pub_prod_Pj1GDbtkn7l1WB5j9fiRQKryPnbteAdo");
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      cardToken = PresignedAcceptanceModel.fromJson(json);
      notifyListeners();
    } catch (e) {
      safePrint('Query failed: ${e.toString()}');
    }
  }

  Future<void> launchLink() async {
    if (presignedAcceptance == null) {
      return;
    }
    final url = Uri.parse(presignedAcceptance!.link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void toggleIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void saveNewCard() async {
    try {
      final uri = Uri.https("production.wompi.co", "/v1/tokens/cards");
      final headers = {'Authorization': "Bearer pub_prod_Pj1GDbtkn7l1WB5j9fiRQKryPnbteAdo"};
      final response = await http.post(uri, headers: headers);
      final json = jsonDecode(response.body);
      cardToken = PresignedAcceptanceModel.fromJson(json);
    } catch (e) {
      rethrow;
    }

    notifyListeners();
  }
}
