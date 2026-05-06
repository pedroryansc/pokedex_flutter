import 'package:flutter/material.dart';

import "pokemon.dart";
import "pokeapi.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: Color.fromARGB(255, 255, 111, 97),
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
      home: const Pokedex(),
    );
  }
}

// Construção da tela inicial (home) - Pokédex (Lista de Pokémons)
class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  final String title = "Pokédex";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Row(
          children: [
            Icon(Icons.catching_pokemon, color: Colors.white),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(title, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Card(
                child: Column(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png",
                    ),
                    Text("Charmeleon"),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/725.png",
                    ),
                    Text("Litten"),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/999.png",
                    ),
                    Text("Gimmighoul"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
