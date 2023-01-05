import 'package:appokemon/model/pokemon_model.dart';
import 'package:appokemon/utils/constants.dart';
import 'package:appokemon/utils/widgets/favorite_elevated_button.dart';
import 'package:appokemon/utils/widgets/pokemon_details_body.dart';
import 'package:appokemon/utils/widgets/pokemon_details_header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../provider/favorite_pokemon.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonModel? pokemonModel;
  final Color? color;

  const PokemonDetailsPage({Key? key, this.pokemonModel, this.color})
      : super(key: key);
  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PokemonDetailsHeader(pokemonModel: widget.pokemonModel),
          PokemonDetailsBody(pokemonModel: widget.pokemonModel),
          Positioned(
              bottom: 100,
              child: FavoriteButtonWidget(pokemonModel: widget.pokemonModel))
        ],
      ),
    );
  }
}
