import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import "package:shared_preferences/shared_preferences.dart";

import "pokeapi.dart";
import "pokemon.dart";

// Construção da tela inicial (home) - Pokédex (Lista de Pokémons)
class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final String title = "Pokédex";

  int? _opcaoSprite;

  @override
  void initState() {
    super.initState();
    _getOpcaoSprite();
  }

  Future<void> _getOpcaoSprite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _opcaoSprite = prefs.getInt("opcaoSprite") ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String tipoSprite = _opcaoSprite == 1 ? "pixel_art" : "arte_oficial";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.catching_pokemon, size: 30),
            Padding(padding: EdgeInsets.all(10), child: Text(title)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () async {
                await Navigator.pushNamed(context, "/configurations");
                _getOpcaoSprite();
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
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/pokemon",
                            arguments: pokemon,
                          );
                        },
                        child: Column(
                          children: [
                            pokemon.sprites[tipoSprite!] != null
                                ? Image.network(
                                    pokemon.sprites[tipoSprite]!,
                                    width: 180,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  )
                                : Icon(Icons.image_not_supported),
                            Text(
                              // Formata o ID para o padrão de apresentação. Ex: Bulbasaur -> #0001
                              NumberFormat("'#'0000").format(pokemon.id),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
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
