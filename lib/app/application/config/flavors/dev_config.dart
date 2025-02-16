import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart';

@dev
@Injectable(as: FlavorConfig)
class DevelopmentConfig implements FlavorConfig {
  @override
  Future<void> initializeEnvironment() async {
    // Add your development environment specific configurations here
  }

  @override
  String get baseUrl => dotenv.env['BASE_URL']!;
}
