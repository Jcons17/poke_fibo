part of 'pokemon_bloc.dart';

sealed class PokemonEvent {}

class GetAllPokemons implements PokemonEvent {}

class GetMyPokemons implements PokemonEvent {}

class AddPokemon implements PokemonEvent {
  final Pokemon pokemon;

  AddPokemon({required this.pokemon});
}

class DeletePokemon implements PokemonEvent {
  final Pokemon pokemon;
  DeletePokemon({required this.pokemon});
}
