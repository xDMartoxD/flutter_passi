import 'dev_env.dart';
import 'env_setup.dart';
import 'prod_env.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();
  //Environment variable to set the environment run the app with cd
  static const String dev = 'dev';
  static const String prod = 'prod';

  late EnvSetup config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  EnvSetup _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdSetup();
      default:
        return ProdSetup();
    }
  }
}
