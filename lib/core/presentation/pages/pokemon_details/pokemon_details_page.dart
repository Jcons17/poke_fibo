import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_template/core/core.dart';
import 'package:flutter_template/gen/assets.gen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: (image != null)
                  ? Image.network(
                      image,
                    )
                  : Assets.images.pokeball.image(),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(),
                  ),
                  ...pokemon.abilities.map(
                    (e) {
                      return Text(
                        e.toString(),
                        style: TextStyle(),
                      );
                    },
                  ),
                  ...?pokemon.forms?.map(
                    (e) {
                      return Text(
                        e.toString(),
                        style: TextStyle(),
                      );
                    },
                  ),
                  ...?pokemon.forms?.map(
                    (e) {
                      return Text(
                        e.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  ...pokemon.moves.map(
                    (e) {
                      return Text(
                        e.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
