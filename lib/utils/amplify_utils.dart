import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import '../constants/amplify_api_names.dart';

Future<String> getDownloadUrl(String key) async {
  try {
    final result = await Amplify.Storage.getUrl(
      key: key,
      options: const StorageGetUrlOptions(
        accessLevel: StorageAccessLevel.guest,
        pluginOptions: S3GetUrlPluginOptions(
          validateObjectExistence: true,
          expiresIn: Duration(days: 1),
        ),
      ),
    ).result;
    return result.url.toString();
  } on StorageException catch (e) {
    safePrint('Could not get a downloadable URL: ${e.message}');
    rethrow;
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
