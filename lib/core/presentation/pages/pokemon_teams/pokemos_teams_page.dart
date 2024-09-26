import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_template/core/presentation/widgets/grid_item_pokemon.dart';

import '../../../core.dart';

@RoutePage()
class PokemosTeamsPage extends StatelessWidget {
  const PokemosTeamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Poke Team"),
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
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          return LoadedDataBuilder(
            data: state.myPokemons,
            onException: (context, data) {
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.red.shade200,
                    ),
                    Gap(16),
                    Text(data.toString()),
                    Gap(16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<PokemonBloc>().getAllPokemons();
                      },
                      child: Text(
                        'Try again',
                      ),
                    ),
                  ],
                ),
              );
            },
            onLoading: (context, cachedData) {
              if (cachedData != null) {
                return AbsorbPointer(
                  absorbing: true,
                  child: Opacity(
                    opacity: 0.5,
                    child: ListViewPokemon(
                      data: cachedData,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey,
                        child: SizedBox.expand(),
                      ),
                    ),
                  );
                },
              );
            },
            onData: (context, data) {
              return ListViewPokemon(
                data: data,
              );
            },
          );
        },
      ),
    );
  }
}

class ListViewPokemon extends StatelessWidget {
  const ListViewPokemon({
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
      context.theme.colorScheme.inversePrimary,
    ];
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final pokemon = data.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridItemPokemon(
            bgColor: bgColors.elementAt(index % 4),
            pokemon: pokemon,
            isInTheTeam: true,
          ),
        );
      },
    );
  }
}
