part of 'pokemon_bloc.dart';

@freezed
class PokemonState with _$PokemonState {
  const PokemonState._();

  const factory PokemonState({
    required LoadedData<List<Pokemon>> myPokemons,
    required LoadedData<List<Pokemon>> allPokemons,
    required LoadedData<List<Pokemon>> addPokemonToMyTeam,
    required LoadedData<Unit> deletePokemonToMyTeam,
    required int offset,
  }) = _PokemonState;

  factory PokemonState.initial() => PokemonState(
        myPokemons: LoadedData(),
        allPokemons: LoadedData(),
        addPokemonToMyTeam: LoadedData(),
        deletePokemonToMyTeam: LoadedData(),
        offset: 0,
      );
}
