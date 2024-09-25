import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          InkWell(
            onTap: () {
              context.read<AuthBloc>().logout();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.red,
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return LoadedDataBuilder(
              data: state.allPokemons,
              onException: (context, data) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red.shade200,
                    ),
                    Gap(16),
                    Text(data.toString()),
                  ],
                );
              },
              onLoading: (context, cachedData) {
                if (cachedData != null) {
                  return AbsorbPointer(
                    absorbing: true,
                    child: Opacity(
                      opacity: 0.5,
                      child: GridPokemon(
                        data: cachedData,
                      ),
                    ),
                  );
                }

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                  ),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: SizedBox.expand(),
                    );
                  },
                );
              },
              onData: (context, data) {
                return GridPokemon(
                  data: data,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class GridPokemon extends StatelessWidget {
  const GridPokemon({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Pokemon> data;

  @override
  Widget build(BuildContext context) {
    final bgColors = [
      context.theme.colorScheme.primary,
      context.theme.colorScheme.secondary,
      context.theme.colorScheme.tertiary,
    ];
    final textColors = [
      context.theme.colorScheme.onPrimary,
      context.theme.colorScheme.onSecondary,
      context.theme.colorScheme.onSecondary,
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final pokemon = data.elementAt(index);
        final image = pokemon.sprites.frontDefault ??
            pokemon.sprites.frontShiny ??
            pokemon.sprites.backDefault ??
            pokemon.sprites.backShiny;

        return GridItemPokemon(
          image: image,
          bgColor: bgColors.elementAt(index % 3),
          pokemon: pokemon,
          textColor: textColors.elementAt(index % 3),
        );
      },
    );
  }
}

class GridItemPokemon extends StatelessWidget {
  const GridItemPokemon({
    super.key,
    required this.image,
    required this.bgColor,
    required this.pokemon,
    required this.textColor,
  });

  final String? image;
  final Color bgColor;
  final Pokemon pokemon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final image = pokemon.sprites.frontDefault ??
        pokemon.sprites.frontShiny ??
        pokemon.sprites.backDefault ??
        pokemon.sprites.backShiny;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: (image != null)
                    ? Image.network(
                        image,
                      )
                    : Assets.images.pokeball.image(),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                ),
                child: Center(
                  child: Text(
                    pokemon.name,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
