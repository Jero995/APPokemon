import 'package:flutter/material.dart';

import '../../model/pokemon_model.dart';
import '../../provider/favorite_pokemon.dart';
import '../constants.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final PokemonModel? pokemonModel;
  const FavoriteButtonWidget({super.key, required this.pokemonModel});

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoritePokemonProvider.of(context);
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: pokemonColorType[widget.pokemonModel!.type![0]],
        ),
        onPressed: () {
          provider.toggleFavorite(widget.pokemonModel!);
        },
        icon: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        label: Text(
          provider.isExist(widget.pokemonModel!)
              ? 'REMOVE FROM FAVORITES'
              : 'ADD TO FAVORITES',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
