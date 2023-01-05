import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/pokemon_model.dart';
import '../../provider/favorite_pokemon.dart';
import '../../screens/pokemon details/pokemon_details_page.dart';
import '../constants.dart';

class PokemonGridViewWidget extends StatefulWidget {
  final Pokedex pokedex;
  const PokemonGridViewWidget({super.key, required this.pokedex});

  @override
  State<PokemonGridViewWidget> createState() => _PokemonGridViewWidgetState();
}

class _PokemonGridViewWidgetState extends State<PokemonGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoritePokemonProvider.of(context);
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 8,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      crossAxisCount: 2,
      children: widget.pokedex.pokemon!.map((pokemonModel) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PokemonDetailsPage(
                          pokemonModel: pokemonModel,
                          color: pokemonColorType[pokemonModel.type![0]],
                        )));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: pokemonColorType[pokemonModel.type![0]],
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        provider.toggleFavorite(pokemonModel);
                      },
                      icon: provider.isExist(pokemonModel)
                          ? Icon(Icons.favorite, color: Colors.red.shade500)
                          : Icon(Icons.favorite_outline,
                              color: Colors.grey.shade100),
                    )),
                Positioned(
                  bottom: 2,
                  right: 0,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl: pokemonModel.img!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          pokemonModel.name!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '#' + pokemonModel.num.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemonModel.type!.map((e) {
                      return Container(
                        margin: const EdgeInsets.only(top: 6),
                        height: 30,
                        child: FilterChip(
                          backgroundColor:
                              pokemonColorType[pokemonModel.type![0]]!
                                  .withOpacity(0.6),
                          label: Text(
                            e,
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                          onSelected: (value) {},
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
