// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/core.dart' as _i446;
import 'core/domain/repository/poke_repository.dart' as _i895;
import 'core/infrastructure/repositories/auth_repository_impl.dart' as _i914;
import 'core/infrastructure/repositories/poke_repository_impl.dart' as _i335;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i446.AuthRepository>(() => _i914.AuthRepositoryImpl(
        sharedPreferences: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i895.PokeRepository>(() => _i335.PokeRepositoryImpl(
          client: gh<_i519.Client>(),
          sharedPreferences: gh<_i460.SharedPreferences>(),
        ));
    return this;
  }
}
