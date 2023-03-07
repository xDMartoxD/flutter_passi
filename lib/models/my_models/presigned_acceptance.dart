class PresignedAcceptance {
  late String acceptanceToken;
  late String link;
  PresignedAcceptance.fromJson(dynamic json) {
    acceptanceToken = json["data"]["presigned_acceptance"]["acceptance_token"];
    link = json["data"]["presigned_acceptance"]["permalink"];
  }
}
