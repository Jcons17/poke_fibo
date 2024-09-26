// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:flutter_template/core/core.dart' as _i10;
import 'package:flutter_template/core/presentation/pages/block/block_page.dart'
    as _i1;
import 'package:flutter_template/core/presentation/pages/home/home_page.dart'
    as _i2;
import 'package:flutter_template/core/presentation/pages/login/login_page.dart'
    as _i3;
import 'package:flutter_template/core/presentation/pages/main/main_page.dart'
    as _i4;
import 'package:flutter_template/core/presentation/pages/pokemon_details/pokemon_details_page.dart'
    as _i5;
import 'package:flutter_template/core/presentation/pages/pokemon_teams/pokemos_teams_page.dart'
    as _i6;
import 'package:flutter_template/core/presentation/pages/sign_up/sign_up_page.dart'
    as _i7;

/// generated route for
/// [_i1.BlockPage]
class BlockRoute extends _i8.PageRouteInfo<void> {
  const BlockRoute({List<_i8.PageRouteInfo>? children})
      : super(
          BlockRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlockRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.BlockPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainPage();
    },
  );
}

/// generated route for
/// [_i5.PokemonDetailsPage]
class PokemonDetailsRoute extends _i8.PageRouteInfo<PokemonDetailsRouteArgs> {
  PokemonDetailsRoute({
    _i9.Key? key,
    required _i10.Pokemon pokemon,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PokemonDetailsRoute.name,
          args: PokemonDetailsRouteArgs(
            key: key,
            pokemon: pokemon,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PokemonDetailsRouteArgs>();
      return _i5.PokemonDetailsPage(
        key: args.key,
        pokemon: args.pokemon,
      );
    },
  );
}

class PokemonDetailsRouteArgs {
  const PokemonDetailsRouteArgs({
    this.key,
    required this.pokemon,
  });

  final _i9.Key? key;

  final _i10.Pokemon pokemon;

  @override
  String toString() {
    return 'PokemonDetailsRouteArgs{key: $key, pokemon: $pokemon}';
  }
}

/// generated route for
/// [_i6.PokemosTeamsPage]
class PokemosTeamsRoute extends _i8.PageRouteInfo<void> {
  const PokemosTeamsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PokemosTeamsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemosTeamsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.PokemosTeamsPage();
    },
  );
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignUpPage();
    },
  );
}
