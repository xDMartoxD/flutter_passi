import '../models/ModelProvider.dart';

const Map<BrandEnum, String> _paymentMethodCardsLogos = {
  BrandEnum.VISA: "assets/images/visa.jpeg",
  BrandEnum.DINERS: ".assets/images/dinners_club.jpeg",
  BrandEnum.MASTERCARD: "assets/images/mastercard.png",
  BrandEnum.AMEX: "assets/images/american_express.png",
};

String getPaymentMethodLogo(PaymentMethodEnum paymentMethodEnum, BrandEnum? brandEnum) {
  if (paymentMethodEnum == PaymentMethodEnum.NEQUI) {
    return "assets/images/nequi.png";
  } else {
    return _paymentMethodCardsLogos[brandEnum!]!;
  }
}
