import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
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
  PresignedAcceptanceModel? _presignedAcceptance;
  bool _isChecked = false;
  PresignedAcceptanceModel? get presignedAcceptance {
    return _presignedAcceptance;
  }

  bool get isChecked => _isChecked;

  List<PaymentMethod> get paymentMethods => [..._paymentMethods];

  PaymentMethod? get selectedPaymentMethod {
    return authenticationProvider!.user?.selectedPaymentMethod;
  }

  PaymentMethodsByUserProvider({this.authenticationProvider});

  PaymentMethodEnum _fromStringToPaymentMethodEnum(String paymentMethodStr) {
    switch (paymentMethodStr) {
      case "CARD":
        return PaymentMethodEnum.CARD;

      case "NEQUI":
        return PaymentMethodEnum.NEQUI;
      case "PSE":
        return PaymentMethodEnum.PSE;
      case "BANCOLOMBIA_TRANSFER":
        return PaymentMethodEnum.BANCOLOMBIA_TRANSFER;
      case "BANCOLOMBIA_COLLECT":
        return PaymentMethodEnum.BANCOLOMBIA_COLLECT;
      default:
        throw Exception("El tipo de metodo de pago no esta definido");
    }
  }

  BrandEnum _fromStringToBrandEnum(String brandStr) {
    switch (brandStr) {
      case "VISA":
        return BrandEnum.VISA;
      case "AMEX":
        return BrandEnum.AMEX;
      case "MASTERCARD":
        return BrandEnum.MASTERCARD;
      case "DINERS":
        return BrandEnum.DINERS;

      default:
        throw Exception("La marca de la tarjeta no esta definida");
    }
  }

  // Future<void> getPaymentMethods() async {
  //   if (authenticationProvider == null ||
  //       authenticationProvider?.user == null) {
  //     return;
  //   }
  //   try {
  //     final request = cognitoRequest(
  //       ModelQueries.list(
  //         PaymentMethod.classType,
  //         where: PaymentMethod.USER.eq(authenticationProvider!.user!.id),
  //       ),
  //     );
  //     safePrint(request.document);
  //     final response = await Amplify.API.query(request: request).response;
  //     final paginatedPaymentMethods = response.data;
  //     if (paginatedPaymentMethods == null) {
  //       safePrint('errors: ${response.errors}');
  //       return;
  //     }
  //     final List<PaymentMethod> loadedPaymentMethods = [];
  //     for (var paymentMethod in paginatedPaymentMethods.items) {
  //       if (paymentMethod != null) {
  //         loadedPaymentMethods.add(paymentMethod);
  //       }
  //     }
  //     _paymentMethods = loadedPaymentMethods;
  //     notifyListeners();
  //   } on ApiException catch (e) {
  //     safePrint('Query failed: $e');
  //   }
  // }

  Future<void> getPaymentMethods() async {
    if (authenticationProvider == null ||
        authenticationProvider?.user == null) {
      return;
    }
    try {
      const paymentMethodsByUser = 'paymentMethodsByUser';
      String graphQLDocument = '''
        query PaymentMethodsByUser(\$userId: ID!) {
          $paymentMethodsByUser(userID: \$userId) {
            items {
              id
              customer_email
              createdAt
              acceptance_token
              paymentSourceID
              status
              token
              type
              updatedAt
              userID
              data {
                bin
                brand
                card_holder
                created_at
                exp_month
                exp_year
                expires_at
                id
                last_four
                name
                phone_number
                status
              }
            }
          }
        }
      ''';

      final ticketsByUserRequest = cognitoRequest(
        GraphQLRequest(
          document: graphQLDocument,
          variables: <String, String>{
            'userId': authenticationProvider!.user!.id
          },
          decodePath: paymentMethodsByUser,
        ),
      );
      final responseGraphQLDocument =
          await Amplify.API.query(request: ticketsByUserRequest).response;
      if (responseGraphQLDocument.data == null) {
        safePrint('errors: ${responseGraphQLDocument.errors}');
        return;
      }
      final data = jsonDecode(responseGraphQLDocument.data);
      final paymentMethodsMap =
          List<Map<String, dynamic>?>.from(data[paymentMethodsByUser]['items']);
      List<PaymentMethod> loadedPaymentMethods = [];
      for (var paymentMethodMap in paymentMethodsMap) {
        if (paymentMethodMap != null) {
          final paymentMethodData = PaymentMethodData(
              bin: paymentMethodMap['data']['bin'],
              brand: _fromStringToBrandEnum(paymentMethodMap['data']['brand']),
              card_holder: paymentMethodMap['data']['card_holder'],
              created_at: paymentMethodMap['data']['created_at'],
              exp_month: paymentMethodMap['data']['exp_month'],
              exp_year: paymentMethodMap['data']['exp_year'],
              expires_at: paymentMethodMap['data']['expires_at'],
              id: paymentMethodMap['data']['id'],
              last_four: paymentMethodMap['data']['last_four'],
              name: paymentMethodMap['data']['name'],
              phone_number: paymentMethodMap['data']['phone_number'],
              status: paymentMethodMap['data']['status']);
          final paymentMethod = PaymentMethod(
            id: paymentMethodMap['id'],
            customer_email: paymentMethodMap['customer_email'],
            createdAt:
                TemporalDateTime.fromString(paymentMethodMap['createdAt']),
            acceptance_token: paymentMethodMap['acceptance_token'],
            paymentSourceID: paymentMethodMap['paymentSourceID'],
            status: paymentMethodMap['status'],
            token: paymentMethodMap['token'],
            type: _fromStringToPaymentMethodEnum(paymentMethodMap['type']),
            updatedAt:
                TemporalDateTime.fromString(paymentMethodMap['updatedAt']),
            user: authenticationProvider!.user,
            data: paymentMethodData,
          );

          loadedPaymentMethods.add(paymentMethod);
        }
        _paymentMethods = loadedPaymentMethods;
      }
      _paymentMethods = loadedPaymentMethods;
      notifyListeners();
    } on ApiException catch (e) {
      safePrint('Query failed $e');
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
          authenticationProvider!.user!.userSelectedPaymentMethodId!
              as ModelIdentifier<PaymentMethod>,
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
      final uri = Uri.https("production.wompi.co",
          "/v1/merchants/pub_prod_Pj1GDbtkn7l1WB5j9fiRQKryPnbteAdo");
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
        final headers = {
          'Authorization': "Bearer pub_prod_Pj1GDbtkn7l1WB5j9fiRQKryPnbteAdo"
        };
        final wompiResponse =
            await http.post(uri, headers: headers, body: json.encode(data));
        if (wompiResponse.statusCode == 201) {
          final json = jsonDecode(wompiResponse.body);
          final createdPaymentMethod = await _createPaymentMethod(json);
          if (createdPaymentMethod == null) {
            return "Error al crear metodo de pago";
          }
          final createPaymentSourceData = await _createPaymentSource(
            createdPaymentMethod.id,
            createdPaymentMethod.token,
            createdPaymentMethod.status!,
          );
          if (createPaymentSourceData != 'ok') {
            return "No se pudo crear el payment source";
          }

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

  Future<String> _createPaymentSource(
    String id,
    String token,
    String status,
  ) async {
    try {
      final restOperation = Amplify.API.post(
        '/create-payment-source',
        body: HttpPayload.json(
          {
            'id': id,
            'token': token,
            'type': "CARD",
            "customer_email": authenticationProvider!.user!.email,
            "acceptance_token": _presignedAcceptance!.acceptanceToken
          },
        ),
      );
      final response = await restOperation.response;
      final body = json.decode(response.decodeBody());
      return body["data"] as String;
    } on ApiException catch (e) {
      safePrint('POST call failed: $e');
      rethrow;
    }
  }

  Future<bool> changeUserSelectedPaymentMethod(
      PaymentMethod? paymentMethod) async {
    if (authenticationProvider == null ||
        authenticationProvider?.user == null) {
      return false;
    }
    {
      if (selectedPaymentMethod == null) {
        return true;
      }
      if (paymentMethod!.id ==
          authenticationProvider?.user?.userSelectedPaymentMethodId) {
        return true;
      }
      try {
        final userWithNewSelectedPaymentMethod =
            authenticationProvider!.user!.copyWith(
          userSelectedPaymentMethodId: paymentMethod.id,
        );

        final updatedUserRequest = cognitoRequest(
            ModelMutations.update(userWithNewSelectedPaymentMethod));
        final updatedUserResponse = await Amplify.API
            .mutate(
              request: updatedUserRequest,
            )
            .response;
        if (updatedUserResponse.data == null) {
          safePrint("errors: ${updatedUserResponse.errors}");
          return false;
        }

        await authenticationProvider!
            .setUser(newUser: updatedUserResponse.data);
        notifyListeners();
        return true;
      } on Exception catch (e) {
        safePrint("BOTO EXCEPCION");
        safePrint(e);
        rethrow;
      }
    }
  }

  Future<bool> deleteUserSelectedPaymentMethod() async {
    if (authenticationProvider == null ||
        authenticationProvider?.user == null) {
      return false;
    }
    {
      try {
        final userWithDeletedSelectedPaymentMethod =
            authenticationProvider!.user!.copyWith(
          userSelectedPaymentMethodId: null,
        );

        final updatedUserRequest = cognitoRequest(
            ModelMutations.update(userWithDeletedSelectedPaymentMethod));
        final updatedUserResponse = await Amplify.API
            .mutate(
              request: updatedUserRequest,
            )
            .response;
        if (updatedUserResponse.data == null) {
          safePrint("errors: ${updatedUserResponse.errors}");
          return false;
        }

        await authenticationProvider!
            .setUser(newUser: updatedUserResponse.data);
        notifyListeners();

        return true;
      } on Exception catch (e) {
        safePrint("BOTO EXCEPCION");
        safePrint(e);
        rethrow;
      }
    }
  }

  Future<PaymentMethod?> _createPaymentMethod(Map<String, dynamic> json) async {
    try {
      final cardToken = CardToken.fromJson(json);
      final paymentMethod =
          cardToken.toPaymentMethod(authenticationProvider!.user!);
      final createPaymentMethodRequest =
          cognitoRequest(ModelMutations.create(paymentMethod));
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

  Future<void> removeUserPaymentMethod(PaymentMethod paymentMethod) async {
    if (paymentMethod.id == selectedPaymentMethod?.id) {
      await deleteUserSelectedPaymentMethod();
    }

    final request = cognitoRequest(ModelMutations.deleteById(
      PaymentMethod.classType,
      paymentMethod.modelIdentifier,
    ));
    final response = await (Amplify.API.mutate(request: request).response);
    safePrint('Response: $response');
  }
}
