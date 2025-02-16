// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobile_coding_challenge/app/application/config/flavors/dev_config.dart'
    as _i298;
import 'package:mobile_coding_challenge/app/application/config/modules.dart'
    as _i353;
import 'package:mobile_coding_challenge/app/domain/api_client/api_client.dart'
    as _i451;
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart'
    as _i699;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final modules = _$Modules();
    gh.factory<_i451.ApiClient>(() => modules.client);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => modules.prefs,
      preResolve: true,
    );
    gh.factory<_i699.FlavorConfig>(
      () => _i298.DevelopmentConfig(),
      registerFor: {_dev},
    );
    return this;
  }
}

class _$Modules extends _i353.Modules {}
