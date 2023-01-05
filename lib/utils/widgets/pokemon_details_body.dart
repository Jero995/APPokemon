import 'package:flutter/material.dart';

import '../../model/pokemon_model.dart';

class PokemonDetailsBody extends StatefulWidget {
  final PokemonModel? pokemonModel;
  const PokemonDetailsBody({super.key, required this.pokemonModel});

  @override
  State<PokemonDetailsBody> createState() => _PokemonDetailsBodyState();
}

class _PokemonDetailsBodyState extends State<PokemonDetailsBody> {
  late double _height, _width;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: _width,
            height: _height * 0.75,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      height: _height * 0.14,
                      width: _width * 0.9,
                      child: Image.asset(
                        'assets/img/splash.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _width * 0.28,
                            child: Text(
                              'Name:',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.pokemonModel!.name!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _width * 0.28,
                            child: Text(
                              'Height:',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.pokemonModel!.height!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _width * 0.28,
                            child: Text(
                              'Weight:',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.pokemonModel!.weight!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _width * 0.28,
                            child: Text(
                              'Spawn Time:',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.pokemonModel!.spawnTime!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Text(
                              'Weakness: ',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.pokemonModel!.weaknesses!.join(", "),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: _width * 0.28,
                            child: Text(
                              'Evolution:',
                              style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              child: widget.pokemonModel!.nextEvolution != null
                                  ? SizedBox(
                                      height: 30,
                                      width: _width * 0.55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.pokemonModel!
                                            .nextEvolution!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              widget.pokemonModel!
                                                  .nextEvolution![index].name!,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : const Text(
                                      "Max evolution",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
