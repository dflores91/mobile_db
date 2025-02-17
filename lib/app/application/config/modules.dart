import 'package:injectable/injectable.dart';
import 'package:mobile_coding_challenge/app/application/config/injectable.dart';
import 'package:mobile_coding_challenge/app/domain/api_client/api_client.dart';
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class Modules {
  ApiClient get client => ApiClient(
      baseUrl: getIt.get<FlavorConfig>().baseUrl,
      interceptors: [PrettyDioLogger()],
  );

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
