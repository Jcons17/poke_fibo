import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_template/core/infrastructure/repositories/auth_repository_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/core/domain/entity/move_expanded.dart';
import 'package:flutter_template/core/utils/utilities/loaded_data.dart';

part 'pokemon_details_bloc.freezed.dart';
part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokeRepository pokeRepository;
  final Pokemon pokemon;

  PokemonDetailsBloc({
    required this.pokeRepository,
    required this.pokemon,
  }) : super(PokemonDetailsState.initial()) {
    on<PokemonDetailsEvent>(
      (event, emit) async {
        switch (event) {
          case GetMoves():
            var list = pokemon.moves
                .take(8)
                .map(
                  (e) {
                    return e.move?.url != null
                        ? Uri.parse(e.move!.url!).pathSegments.elementAt(Uri.parse(e.move!.url!).pathSegments.length - 2)
                        : null;
                  },
                )
                .whereNotNull()
                .toList();

            emit(state.copyWith(move: state.move.copyWithLoading()));

            final result = await pokeRepository.getMoves(
              ids: list,
            );

            emit(state.copyWith(move: state.move.copyWithData(data: result)));

            return;
        }
      },
    );

    add(GetMoves());
  }
}
