import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:passi_app/models/ModelProvider.dart';

class CardToken {
  late String status;
  late String id;
  late DateTime createdAt;
  late BrandEnum brand;
  late String lastFour;
  late String bin;
  late String expYear;
  late String expMonth;
  late String cardHolder;
  late String expiresAt;
  late String name;

  CardToken.fromJson(Map<String, dynamic> data) {
    id = data["data"]["id"];
    status = data["status"];
    createdAt = DateTime.parse(data["data"]["created_at"]);
    brand = _toBrand(data["data"]["brand"]!);
    lastFour = data["data"]["last_four"];
    name = data["data"]["name"];
    bin = data["data"]["bin"];
    expYear = data["data"]["exp_year"];
    expMonth = data["data"]["exp_month"];
    cardHolder = data["data"]["card_holder"];
    expiresAt = data["data"]["expires_at"];
  }

  PaymentMethod toPaymentMethod(User user) {
    return PaymentMethod(
        status: status,
        data: PaymentMethodData(
          bin: bin,
          brand: brand,
          card_holder: cardHolder,
          created_at: createdAt.toIso8601String(),
          exp_month: expMonth,
          exp_year: expYear,
          expires_at: expiresAt,
          last_four: lastFour,
          name: name,
          id: id,
          status: status,
        ),
        user: user,
        type: PaymentMethodEnum.CARD,
        token: id,
        customer_email: user.email,
        createdAt: TemporalDateTime(DateTime.now()),
        updatedAt: TemporalDateTime(DateTime.now()));
  }

  BrandEnum _toBrand(String brandString) {
    BrandEnum brand = BrandEnum.VISA;
    switch (brandString) {
      case "AMEX":
        brand = BrandEnum.AMEX;
        break;
      case "MASTERCARD":
        brand = BrandEnum.DINERS;
        break;
      case "DINERS":
        brand = BrandEnum.DINERS;
        break;
    }
    return brand;
  }
}
