import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/domain/entity/move_expanded.dart';
import 'package:flutter_template/core/domain/entity/pokemon.dart';

abstract class PokeRepository {
  Future<Either<Exception, List<Pokemon>>> getAllPokemon({
    int limit = 10,
    int offset = 0,
  });

  Future<Either<Exception, List<MoveExpanded>>> getMoves({
    required List<String> ids,
  });

  Future<Either<Exception, List<Pokemon>>> getMyTeamPokemon();
  Future<Either<Exception, List<Pokemon>>> savePokemonForMyTeam(Pokemon pokemon);
  Future<Either<Exception, Unit>> deletePokemonForMyTeam(Pokemon pokemon);
}
