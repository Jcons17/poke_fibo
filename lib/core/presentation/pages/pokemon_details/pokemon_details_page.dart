import 'package:auto_route/auto_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/application/bloc/pages/pokemon_details/pokemon_details_bloc.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/core/domain/entity/move_expanded.dart';
import 'package:flutter_template/dependency_injection.dart';
import 'package:flutter_template/gen/assets.gen.dart';
import 'package:gap/gap.dart';
import 'package:graphic/graphic.dart';

@RoutePage()
class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final image = pokemon.sprites.frontDefault ??
        pokemon.sprites.frontShiny ??
        pokemon.sprites.backDefault ??
        pokemon.sprites.backShiny;

    return BlocProvider(
      create: (context) => PokemonDetailsBloc(
        pokemon: pokemon,
        pokeRepository: getIt(),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(pokemon.name),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: (image != null)
                          ? Image.network(
                              image,
                            )
                          : Assets.images.pokeball.image(),
                    ),
                    Gap(32),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "General Stats: ",
                        style: context.theme.textTheme.titleLarge!.copyWith(color: context.theme.primaryColor),
                      ),
                    ),
                    Gap(16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.balance,
                                  color: context.theme.colorScheme.primary,
                                ),
                                Text(
                                  pokemon.weight.toString(),
                                  style: TextStyle(
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.height,
                                  color: context.theme.colorScheme.primary,
                                ),
                                Text(
                                  pokemon.height.toString(),
                                  style: TextStyle(
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  "Height",
                                  style: TextStyle(
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.work,
                                  color: context.theme.colorScheme.primary,
                                ),
                                Text(
                                  pokemon.baseExperience.toString(),
                                  style: TextStyle(
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  "Experience",
                                  style: TextStyle(
                                    color: context.theme.colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(32),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Chart(
                            data: pokemon.stats.map(
                              (e) {
                                return {
                                  'name': e.stat?.name ?? "",
                                  'baseState': e.baseStat,
                                };
                              },
                            ).toList(),
                            variables: {
                              'name': Variable(
                                accessor: (Map map) => (map['name'] as String),
                              ),
                              'baseState': Variable(
                                accessor: (Map map) => map['baseState'] as num,
                              ),
                            },
                            marks: [IntervalMark()],
                            axes: [
                              Defaults.horizontalAxis,
                              Defaults.verticalAxis,
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Move Stats: ",
                        style: context.theme.textTheme.titleLarge!.copyWith(color: context.theme.primaryColor),
                      ),
                    ),
                    BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
                      builder: (context, state) {
                        return LoadedDataBuilder(
                          data: state.move,
                          onLoading: (context, cachedData) => CircularProgressIndicator(),
                          onData: (context, data) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Power",
                                    style: context.theme.textTheme.titleMedium!.copyWith(color: context.theme.primaryColor),
                                  ),
                                ),
                                createChart(
                                  data.map(
                                    (e) {
                                      return {
                                        'name': e.name,
                                        'baseState': e.power ?? 0,
                                      };
                                    },
                                  ).toList(),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Accuracy",
                                    style: context.theme.textTheme.titleMedium!.copyWith(color: context.theme.primaryColor),
                                  ),
                                ),
                                createChart(
                                  data.map(
                                    (e) {
                                      return {
                                        'name': e.name,
                                        'baseState': e.accuracy ?? 0,
                                      };
                                    },
                                  ).toList(),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Power Points",
                                    style: context.theme.textTheme.titleMedium!.copyWith(color: context.theme.primaryColor),
                                  ),
                                ),
                                createChart(
                                  data.map(
                                    (e) {
                                      return {
                                        'name': e.name,
                                        'baseState': e.pp ?? 0,
                                      };
                                    },
                                  ).toList(),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox createChart(List<Map<dynamic, dynamic>> data) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Chart(
        data: data,
        variables: {
          'name': Variable(
            accessor: (Map map) => (map['name'] as String),
          ),
          'baseState': Variable(
            accessor: (Map map) => map['baseState'] as num,
          ),
        },
        marks: [IntervalMark()],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
      ),
    );
  }
}
