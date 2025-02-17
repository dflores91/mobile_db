import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart';

@prod
@Injectable(as: FlavorConfig)
class ProductionConfig implements FlavorConfig {
  @override
  Future<void> initializeEnvironment() async {}

  @override
  String get baseUrl => dotenv.env['BASE_URL']!;
  @override
  String get token => dotenv.env['TOKEN_MOVIE_DB']!;
  @override
  String get urlImage => dotenv.env['URL_IMAGE']!;
}
