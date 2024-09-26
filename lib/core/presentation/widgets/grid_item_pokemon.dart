import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/gen/assets.gen.dart';

class GridItemPokemon extends StatelessWidget {
  const GridItemPokemon({
    Key? key,
    required this.bgColor,
    required this.pokemon,
    required this.isInTheTeam,
  }) : super(key: key);

  final Color bgColor;
  final Pokemon pokemon;
  final bool isInTheTeam;

  @override
  Widget build(BuildContext context) {
    final image = pokemon.sprites.frontDefault ??
        pokemon.sprites.frontShiny ??
        pokemon.sprites.backDefault ??
        pokemon.sprites.backShiny;

    return InkWell(
      onTap: () {
        context.router.push(PokemonDetailsRoute(pokemon: pokemon));
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: bgColor.withOpacity(0.1),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: (image != null)
                          ? Image.network(
                              image,
                              fit: BoxFit.fill,
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
                        child: FittedBox(
                          child: Text(
                            pokemon.name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      if (isInTheTeam) {
                        return context.read<PokemonBloc>().deletePokemon(pokemon);
                      }
                      return context.read<PokemonBloc>().setPokemonOnTeam(pokemon);
                    },
                    child: Icon(
                      this.isInTheTeam ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
