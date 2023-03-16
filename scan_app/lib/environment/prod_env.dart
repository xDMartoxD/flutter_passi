import 'env_setup.dart';

class ProdSetup implements EnvSetup {
  @override
  String get url =>
      'https://8d1a8ru57e.execute-api.us-east-1.amazonaws.com/prod';
}
