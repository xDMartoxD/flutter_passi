import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

Future<String?> getUrl(String key) async {
  try {
    S3GetUrlOptions options =
        S3GetUrlOptions(accessLevel: StorageAccessLevel.private, expires: 10000);
    GetUrlResult result = await Amplify.Storage.getUrl(key: key, options: options);

    return result.url;
  } catch (e) {
    print('GetUrl Err: ' + e.toString());
  }
}
