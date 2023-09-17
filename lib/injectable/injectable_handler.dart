import 'package:better_training_refactored/injectable/injectable_handler.config.dart';
import 'package:better_training_refactored/util/logger.util.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String env) async {
  getIt.init(environment: env);

}


abstract class Env {
  static const String dev = 'dev';
  static const String prod = 'prod';
  final Logger logger = getLogger();

  String get env;
  String get databaseName;
}



@Injectable(as : Env, env: [Env.dev])
class EnvConfigDev extends Env{
  EnvConfigDev();
  final String _env = 'dev';

  @override
  String get env {
    logger.i("get EnvConfig called - Dev");
    return _env;
  }
  @override
  String get databaseName {
    logger.i("get databaseName called - Dev");
    return 'dev_db';
  }
}

@Injectable(as : Env, env: [Env.prod])
class EnvConfigProd extends Env{
  EnvConfigProd();
  final String _env = 'prod';
  @override
  String get env {
    logger.i("get EnvConfig called - Prod");
    return _env;
  }
  @override
  String get databaseName {
    logger.i("get databaseName called - Prod");
    return 'prod_db';
  }
}


