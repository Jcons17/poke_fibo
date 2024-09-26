import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/core/presentation/widgets/grid_pokemon.dart';

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
        child: BlocBuilder<PokemonBloc, PokemonState>(
          builder: (context, state) {
            return NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                  context.read<PokemonBloc>().getAllPokemons();
                }
                return true;
              },
              child: LoadedDataBuilder(
                data: state.allPokemons,
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
                        child: GridPokemon(
                          data: cachedData,
                          favorites: state.myPokemons.value ?? [],
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
                  return GridPokemon(
                    data: data,
                    favorites: state.myPokemons.value ?? [],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
