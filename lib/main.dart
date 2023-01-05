import 'package:appokemon/provider/favorite_pokemon.dart';
import 'package:appokemon/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritePokemonProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'APPokemon',
        home: HomePage(),
      ),
    );
  }
}
