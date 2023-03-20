import 'dart:convert';
import 'dart:typed_data';

import 'package:amplify_api/model_mutations.dart';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/models/ModelProvider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/utils/amplify_utils.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../models/my_models/card_token.dart';
import '../models/my_models/presigned_acceptance.dart';

class PaymentMethodsByUserProvider with ChangeNotifier {
  final AuthenticationProvider? authenticationProvider;
  List<PaymentMethod> _paymentMethods = [];
  PaymentMethod? _userSelectedPaymentMethod;
  PresignedAcceptanceModel? _presignedAcceptance;
  bool _isChecked = false;
  PaymentMethod? _selectedPaymentMethod;
  PresignedAcceptanceModel? get presignedAcceptance {
    return _presignedAcceptance;
  }

  bool get isChecked {
    return _isChecked;
  }

  List<PaymentMethod> get paymentMethods {
    return [..._paymentMethods];
  }

  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  PaymentMethod? get userSelectedPaymentMethod => _userSelectedPaymentMethod;

  PaymentMethodsByUserProvider({this.authenticationProvider});

  Future<void> getPaymentMethods() async {
    if (authenticationProvider == null || authenticationProvider?.user == null) {
      return;
    }
    try {
      final request = cognitoRequest(
        ModelQueries.list(
          PaymentMethod.classType,
          where: PaymentMethod.USER.eq(authenticationProvider!.user!.id),
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paginatedPaymentMethods = response.data;
      if (paginatedPaymentMethods == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      final List<PaymentMethod> loadedPaymentMethods = [];
      for (var element in paginatedPaymentMethods.items) {
        if (element != null) {
          loadedPaymentMethods.add(element);
          if (element.id == authenticationProvider?.user?.userSelectedPaymentMethodId) {
            _selectedPaymentMethod = element;
          }
        }
      }
      _paymentMethods = loadedPaymentMethods;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  Future<void> getUserSelectedPaymentMethod() async {
    if (authenticationProvider == null ||
        authenticationProvider?.user == null ||
        authenticationProvider?.user?.userSelectedPaymentMethodId == null) {
      return;
    }
    try {
      final request = cognitoRequest(
        ModelQueries.get(
          PaymentMethod.classType,
          authenticationProvider!.user!.userSelectedPaymentMethodId!,
        ),
      );
      final response = await Amplify.API.query(request: request).response;
      final paymentMethod = response.data;
      if (paymentMethod == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  Future<void> fetchTermsAndConditions() async {
    try {
      final uri = Uri.https(
          "production.wompi.co", "/v1/merchants/pub_prod_Pj1GDbtkn7l1WB5j9fiRQKryPnbteAdo");
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      _presignedAcceptance = PresignedAcceptanceModel.fromJson(json);
      notifyListeners();
    } catch (e) {
      safePrint('Query failed: ${e.toString()}');
    }
  }

  Future<void> launchLink() async {
    if (_presignedAcceptance == null) {
      return;
    }
    final url = Uri.parse(_presignedAcceptance!.link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void toggleIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  Future<String?> saveNewCard(Map<String, String> data) async {
    await fetchTermsAndConditions();
    if (authenticationProvider != null &&
        authenticationProvider?.user != null &&
        presignedAcceptance != null) {
      try {
        final uri = Uri.https("production.wompi.co", "/v1/tokens/cards");
        final headers = {'Authorization': "Bearer pub_prod_Pj1GDbtkn7l1WB5j9fiRQKryPnbteAdo"};
        final wompiResponse = await http.post(uri, headers: headers, body: json.encode(data));
        if (wompiResponse.statusCode == 201) {
          final json = jsonDecode(wompiResponse.body);
          final createdPaymentMethod = await _createPaymentMethod(json);
          if (createdPaymentMethod == null) {
            return "Error al crear metodo de pago";
          }
          _createPaymentSource(createdPaymentMethod.id, createdPaymentMethod.token);
          final didChangedUserSelectedPaymentMethod =
              await changeUserSelectedPaymentMethod(createdPaymentMethod);
          if (!didChangedUserSelectedPaymentMethod) {
            return "Error al actualizar al usuario";
          }
          notifyListeners();
          return null;
        }

        return "Error al comunicarse con wompi";
      } catch (e) {
        rethrow;
      }
    }
    return "No hay usaurio";
  }

  Future<void> _createPaymentSource(String id, String token) async {
    try {
      final options = RestOptions(
        path: '/create-payment-source',
        body: Uint8List.fromList('{\'id\':\'$id\', \'token\': \'$token\'}'.codeUnits),
      );
      final response = await Amplify.API.post(restOptions: options).response;
      safePrint(response);
    } on ApiException catch (e) {
      safePrint('POST call failed: $e');
    }
  }

  Future<bool> changeUserSelectedPaymentMethod(PaymentMethod paymentMethod) async {
    if (authenticationProvider == null ||
        authenticationProvider?.user == null ||
        authenticationProvider?.user?.userSelectedPaymentMethodId == null) {
      return false;
    }
    {
      if (paymentMethod.id == authenticationProvider?.user?.userSelectedPaymentMethodId) {
        return true;
      }
      final userWithNewSelectedPaymentMethod = authenticationProvider!.user!.copyWith(
        userSelectedPaymentMethodId: paymentMethod.id,
      );

      final updatedUserRequest =
          cognitoRequest(ModelMutations.update(userWithNewSelectedPaymentMethod));
      final updatedUserResponse = await Amplify.API
          .mutate(
            request: updatedUserRequest,
          )
          .response;
      if (updatedUserResponse.data == null) {
        safePrint("errors: ${updatedUserResponse.errors}");
        return false;
      }

      await authenticationProvider!.setUser(newUser: updatedUserResponse.data);
      _selectedPaymentMethod = paymentMethod;
      notifyListeners();

      return true;
    }
  }

  Future<PaymentMethod?> _createPaymentMethod(Map<String, dynamic> json) async {
    try {
      final cardToken = CardToken.fromJson(json);
      final paymentMethod = cardToken.toPaymentMethod(authenticationProvider!.user!);
      final createPaymentMethodRequest = cognitoRequest(ModelMutations.create(paymentMethod));
      final createPaymentMethodResponse = await Amplify.API
          .mutate(
            request: createPaymentMethodRequest,
          )
          .response;

      if (createPaymentMethodResponse.data == null) {
        safePrint("errors: ${createPaymentMethodResponse.errors}");
        return null;
      }
      return createPaymentMethodResponse.data;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
