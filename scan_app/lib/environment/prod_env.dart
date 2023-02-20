import 'env_setup.dart';

class ProdSetup implements EnvSetup {
  @override
  String get url =>
      'https://9jvruxi9xk.execute-api.us-east-1.amazonaws.com/prod';
}
