import 'package:appokemon/provider/favorite_pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';
import '../pokemon details/pokemon_details_page.dart';

class FavoritesPokemonPage extends StatefulWidget {
  const FavoritesPokemonPage({super.key});

  @override
  State<FavoritesPokemonPage> createState() => _FavoritesPokemonPageState();
}

class _FavoritesPokemonPageState extends State<FavoritesPokemonPage> {
  late double _width, _height;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    final provider = FavoritePokemonProvider.of(context);
    final pokemon = provider.pokemon;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: ListView.builder(
          itemCount: pokemon.length,
          itemBuilder: ((context, index) {
            final pokemons = pokemon[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PokemonDetailsPage(
                              pokemonModel: pokemons,
                              color: pokemonColorType[pokemons.type![0]],
                            )));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                    color: pokemonColorType[pokemons.type![0]]!,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: pokemonColorType[pokemons.type![0]]!)),
                child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: pokemons.img!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    pokemons.name!,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    pokemons.type!.join(", "),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(pokemons);
                    },
                    icon: provider.isExist(pokemons)
                        ? Icon(Icons.favorite, color: Colors.red.shade500)
                        : Icon(Icons.favorite_outline,
                            color: Colors.grey.shade100),
                  ),
                ),
              ),
            );
          })),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(top: _height * 0.01),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      toolbarHeight: _height * 0.06,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          width: _width,
          height: _height * 0.06,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin:
                  EdgeInsets.only(top: _height * 0.022, left: _width * 0.14),
              child: Center(
                  child: Lottie.asset(
                'assets/img/pokeball.json',
                frameRate: FrameRate(30),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              width: _width * 0.4,
              margin: EdgeInsets.only(top: _height * 0.02),
              child: Image.asset('assets/img/favorites-title.png',
                  fit: BoxFit.contain),
            ),
          ]),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
