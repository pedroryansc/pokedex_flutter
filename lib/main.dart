import 'package:flutter/material.dart';
import "pokeapi.dart";
import "pokemon.dart";

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
            Icon(Icons.settings, color: Colors.white),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: FutureBuilder(
        future: PokeAPI().getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return Text("Erro ao carregar os Pokémons: ${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Pokemon> pokemons = snapshot.data!;

            return Container(
              alignment: .topCenter,
              child: Wrap(
                alignment: .spaceEvenly,
                children: pokemons.map((pokemon) {
                  // Futuramente, adicionar um SingleChildScrollView ou ListView.builder
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          pokemon.sprite,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          pokemon.id,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(pokemon.nome, style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          } else {
            return Text("Nenhum Pokémon foi encontrado.");
          }
        },
      ),
    );
  }
}
