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
import 'package:mobile_coding_challenge/app/application/config/flavors/prod_config.dart'
    as _i195;
import 'package:mobile_coding_challenge/app/application/config/modules.dart'
    as _i353;
import 'package:mobile_coding_challenge/app/application/root/root_cubit.dart'
    as _i1029;
import 'package:mobile_coding_challenge/app/domain/api_client/api_client.dart'
    as _i451;
import 'package:mobile_coding_challenge/app/domain/app_storage/app_storage.dart'
    as _i14;
import 'package:mobile_coding_challenge/app/domain/flavors/flavors_config.dart'
    as _i699;
import 'package:mobile_coding_challenge/app/domain/movies/movies_repository.dart'
    as _i173;
import 'package:mobile_coding_challenge/app/infrastructure/app_storage/app_storage_facade.dart'
    as _i208;
import 'package:mobile_coding_challenge/app/infrastructure/movies/movies_facade.dart'
    as _i816;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _prod = 'prod';

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
    gh.factory<_i816.MoviesFacade>(
      () => _i173.MoviesRepository(gh<_i451.ApiClient>()),
    );
    gh.factory<_i699.FlavorConfig>(
      () => _i298.DeveloperConfig(),
      registerFor: {_dev},
    );
    gh.factory<_i14.AppStorage>(
      () => _i208.AppStorageKeyValue(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i1029.RootCubit>(
      () => _i1029.RootCubit(gh<_i816.MoviesFacade>(), gh<_i14.AppStorage>()),
    );
    gh.factory<_i699.FlavorConfig>(
      () => _i195.ProductionConfig(),
      registerFor: {_prod},
    );
    return this;
  }
}

class _$Modules extends _i353.Modules {}
