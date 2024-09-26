import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/domain/entity/move_expanded.dart';
import 'package:flutter_template/core/infrastructure/dtos/move_expanded_dto.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_template/core/domain/entity/pokemon.dart';
import 'package:flutter_template/core/domain/repository/poke_repository.dart';
import 'package:flutter_template/core/infrastructure/dtos/pokemon_dto.dart';
import 'package:flutter_template/core/infrastructure/dtos/remote_pokemon_response_dto.dart';

@LazySingleton(as: PokeRepository)
class PokeRepositoryImpl implements PokeRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  PokeRepositoryImpl({
    required this.client,
    required this.sharedPreferences,
  });

  static const String api_url = "https://pokeapi.co/api/v2/";
  static const String TEAM_POKEMON_KEY = "team_pokemon_key";

  @override
  Future<Either<Exception, Unit>> deletePokemonForMyTeam(Pokemon pokemon) async {
    final pokemonListJson = sharedPreferences
        .getStringList(TEAM_POKEMON_KEY)
        ?.map(
          (e) => PokemonDto.fromJson(e),
        )
        .toList();

    final newList = [...?pokemonListJson]
        .where(
          (element) => element.id != pokemon.id,
        )
        .map((e) => e.toJson())
        .toList();

    await sharedPreferences.setStringList(TEAM_POKEMON_KEY, newList);

    return right(unit);
  }

  @override
  Future<Either<Exception, List<Pokemon>>> getAllPokemon({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final url = Uri.parse(api_url + "pokemon").replace(
        queryParameters: {"offset": offset.toString(), "limit": limit.toString()},
      );

      final response = await client.get(url);

      if (response.statusCode == 200) {
        final data = RemotePokemonResponseDto.fromJson(jsonDecode(response.body));
        final results = data.results
            .map(
              (e) => client.get(Uri.parse(e.url)),
            )
            .toList();

        final pokemonsToFetch = await Future.wait(results).then(
          (value) => value.toList(),
        );

        final map = pokemonsToFetch
            .map(
              (response) {
                if (response.statusCode == 200) {
                  final data = jsonDecode(response.body);
                  return PokemonDto.fromMap(data);
                }
                return null;
              },
            )
            .whereNotNull()
            .toList();
        return right(map);
      } else {
        return left(Exception("Error fetching the data"));
      }
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Pokemon>>> getMyTeamPokemon() async {
    try {
      return right(
        sharedPreferences
                .getStringList(TEAM_POKEMON_KEY)
                ?.map(
                  (e) => PokemonDto.fromJson(e),
                )
                .toList() ??
            [],
      );
    } on Exception catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Exception, List<Pokemon>>> savePokemonForMyTeam(Pokemon pokemon) async {
    final pokemonListJson = sharedPreferences
        .getStringList(TEAM_POKEMON_KEY)
        ?.map(
          (e) => PokemonDto.fromJson(e),
        )
        .toList();

    if (pokemonListJson != null && pokemonListJson.length == 6) return left(Exception("you can't add more than 6 pokemon"));

    final newList = [...?pokemonListJson, pokemon].map((e) => e.toJson()).toList();

    await sharedPreferences.setStringList(TEAM_POKEMON_KEY, newList);

    return right([...?pokemonListJson, pokemon]);
  }

  @override
  Future<Either<Exception, List<MoveExpanded>>> getMoves({required List<String> ids}) async {
    final results = ids
        .map(
          (id) => client.get(Uri.parse(api_url + "move/" + id)),
        )
        .toList();

    final pokemonsToFetch = await Future.wait(results).then(
      (value) => value.toList(),
    );

    final map = pokemonsToFetch
        .map(
          (response) {
            if (response.statusCode == 200) {
              final data = jsonDecode(response.body);
              return MoveExpandedDto.fromMap(data);
            }
            return null;
          },
        )
        .whereNotNull()
        .toList();

    return right(map);
  }
}
