part of 'pokemon_details_bloc.dart';

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState({
    required LoadedData<List<MoveExpanded>> move,
  }) = _PokemonDetailsState;

  factory PokemonDetailsState.initial() => PokemonDetailsState(move: LoadedData());
}
