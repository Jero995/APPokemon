import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pokemon_model.dart';

class FavoritePokemonProvider extends ChangeNotifier {
  List<PokemonModel> _pokemon = [];

  List<PokemonModel> get pokemon => _pokemon;

  void toggleFavorite(PokemonModel pokemonModel) {
    final isExist = _pokemon.contains(pokemonModel);
    if (isExist) {
      _pokemon.remove(pokemonModel);
    } else {
      _pokemon.add(pokemonModel);
    }
    notifyListeners();
  }

  bool isExist(PokemonModel pokemonModel) {
    final isExist = _pokemon.contains(pokemonModel);
    return isExist;
  }

  void clearFavorite() {
    _pokemon = [];
    notifyListeners();
  }

  static FavoritePokemonProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoritePokemonProvider>(
      context,
      listen: listen,
    );
  }
}
