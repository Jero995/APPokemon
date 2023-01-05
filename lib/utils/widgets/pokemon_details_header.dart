import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/pokemon_model.dart';

class PokemonDetailsHeader extends StatelessWidget {
  final PokemonModel? pokemonModel;

  const PokemonDetailsHeader({super.key, required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 40,
          left: 5,
          child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        Positioned(
            top: 90,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pokemonModel!.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "#" + pokemonModel!.num!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )),
        Positioned(
            top: 130,
            left: 22,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                pokemonModel!.type!.join(", "),
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.left,
              ),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )),
        Positioned(
          top: 80,
          left: 190,
          child: CachedNetworkImage(
            height: 100,
            width: 100,
            imageUrl: pokemonModel!.img!,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
