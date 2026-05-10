import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import "pokeapi.dart";
import "pokemon.dart";

import "configurations.dart";

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
        /*
        colorScheme: .fromSeed(
          seedColor: Color.fromARGB(255, 255, 111, 97),
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
        */
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 111, 97),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 111, 97),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      home: const Pokedex(),
      routes: {"/configurations": (context) => Configurations()},
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
        title: Row(
          children: [
            Icon(Icons.catching_pokemon),
            Padding(padding: EdgeInsets.all(10), child: Text(title)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/configurations");
              },
              icon: Icon(Icons.settings),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.white, height: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
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
                  spacing: 2,
                  children: pokemons.map((pokemon) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            /*
                            pokemon.sprite == "2"
                                ? pokemon.sprite
                                : pokemon.nome,
                            */
                            pokemon.sprite,
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            // Formata o ID para o padrão de apresentação. Ex: Bulbasaur -> #0001
                            NumberFormat("'#'0000").format(pokemon.id),
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              pokemon.nome,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
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
      ),
    );
  }
}
