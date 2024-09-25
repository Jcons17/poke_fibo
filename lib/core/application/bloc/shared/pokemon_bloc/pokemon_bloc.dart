import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_template/core/core.dart';

part 'pokemon_bloc.freezed.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokeRepository pokeRepository;

  static const int limit = 18;

  PokemonBloc({
    required this.pokeRepository,
  }) : super(PokemonState.initial()) {
    on<PokemonEvent>((event, emit) async {
      switch (event) {
        case GetAllPokemons():
          emit(state.copyWith(allPokemons: state.allPokemons.copyWithLoading()));
          final result = await pokeRepository.getAllPokemon(limit: limit, offset: limit * state.offset);
          emit(state.copyWith(allPokemons: state.allPokemons.copyWithData(data: result), offset: state.offset + 1));
          return;
        case GetMyPokemons():
          emit(state.copyWith(myPokemons: state.myPokemons.copyWithLoading()));
          final result = await pokeRepository.getMyTeamPokemon();
          emit(state.copyWith(myPokemons: state.myPokemons.copyWithData(data: result)));
          return;
        case AddPokemon(pokemon: final pokemon):
          emit(state.copyWith(addPokemonToMyTeam: state.addPokemonToMyTeam.copyWithLoading()));
          final result = await pokeRepository.savePokemonForMyTeam(pokemon);
          emit(state.copyWith(addPokemonToMyTeam: state.myPokemons.copyWithData(data: result)));
          return;
        case DeletePokemon(pokemon: final pokemon):
          emit(state.copyWith(deletePokemonToMyTeam: state.deletePokemonToMyTeam.copyWithLoading()));
          final result = await pokeRepository.deletePokemonForMyTeam(pokemon);
          emit(state.copyWith(deletePokemonToMyTeam: state.deletePokemonToMyTeam.copyWithData(data: result)));

          return;
      }
    });
  }
}
