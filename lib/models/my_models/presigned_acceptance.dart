class PresignedAcceptanceModel {
  late String acceptanceToken;
  late String link;
  PresignedAcceptanceModel.fromJson(dynamic json) {
    acceptanceToken = json["data"]["presigned_acceptance"]["acceptance_token"];
    link = json["data"]["presigned_acceptance"]["permalink"];
  }
}
