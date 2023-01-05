import 'dart:convert';
import 'package:appokemon/model/pokemon_model.dart';
import 'package:appokemon/screens/favorites/favorites_pokemon_page.dart';
import 'package:appokemon/utils/widgets/pokemon_gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pokedex? pokedex;
  late double _width, _height;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: pokedex == null
          ? Center(
              child: Lottie.asset(
                'assets/img/pokeball.json',
                frameRate: FrameRate(30),
                fit: BoxFit.cover,
              ),
            )
          : Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PokemonGridViewWidget(pokedex: pokedex!),
                  ],
                ),
              ),
            ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
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
                  EdgeInsets.only(top: _height * 0.022, left: _width * 0.048),
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
              child: Image.asset('assets/img/pokedex-title.png',
                  fit: BoxFit.contain),
            ),
            Padding(
              padding: EdgeInsets.only(left: _width * 0.34, top: 6),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return FavoritesPokemonPage();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 32,
                  )),
            )
          ]),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  void fetchPokemonData() async {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    await http.get(url).then((res) {
      if (res.statusCode == 200) {
        var decodedJsonData = jsonDecode(res.body);

        setState(() {
          pokedex = Pokedex.fromJson(decodedJsonData);
          print(pokedex!.pokemon!.length);
        });
      } else {}
    });
  }
}
