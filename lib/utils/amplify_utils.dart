import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import '../constants/amplify_api_names.dart';

Future<String?> getUrl(String key) async {
  try {
    S3GetUrlOptions options =
        S3GetUrlOptions(accessLevel: StorageAccessLevel.private, expires: 10000);
    GetUrlResult result = await Amplify.Storage.getUrl(key: key, options: options);
    return result.url;
  } on StorageException catch (storeError) {
    safePrint('Storage failed - ${storeError.message}');
    return '';
  }
}

GraphQLRequest<K> cognitoRequest<K>(GraphQLRequest<K> request) {
  return GraphQLRequest(
    document: request.document,
    apiName: cognitoApiName,
    decodePath: request.decodePath,
    modelType: request.modelType,
    variables: request.variables,
  );
}

GraphQLRequest<K> apiKeyRequest<K>(GraphQLRequest<K> request) {
  return GraphQLRequest(
    document: request.document,
    apiName: apiKeyApiName,
    decodePath: request.decodePath,
    modelType: request.modelType,
    variables: request.variables,
  );
}
