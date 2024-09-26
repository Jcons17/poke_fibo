import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/core/presentation/pages/home/home_page.dart';
import 'package:flutter_template/core/presentation/widgets/grid_item_pokemon.dart';

class GridPokemon extends StatefulWidget {
  const GridPokemon({
    Key? key,
    required this.data,
    required this.favorites,
  }) : super(key: key);

  final List<Pokemon> data;
  final List<Pokemon> favorites;

  @override
  State<GridPokemon> createState() => _GridPokemonState();
}

class _GridPokemonState extends State<GridPokemon> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<PokemonBloc>().getAllPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bgColors = [
      context.theme.colorScheme.primary,
      context.theme.colorScheme.secondary,
      context.theme.colorScheme.tertiary,
      context.theme.colorScheme.inversePrimary,
    ];

    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          final pokemon = widget.data.elementAt(index);

          return GridItemPokemon(
            bgColor: bgColors.elementAt(index % 4),
            pokemon: pokemon,
            isInTheTeam: widget.favorites.any(
              (element) => element.id == pokemon.id,
            ),
          );
        },
      ),
    );
  }
}
