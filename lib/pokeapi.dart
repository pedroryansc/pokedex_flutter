import "pokemon.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

class PokeAPI {
  Future<List<Pokemon>> getPokemons() async {
    final json = await rootBundle.loadString("assets/json/pokemons.json");

    final pokemonsMap = jsonDecode(json) as Map<String, dynamic>;

    List<Pokemon> pokemons = [];
    for (Map<String, dynamic> pokemonMap in pokemonsMap["results"]) {
      final pokemonObj = Pokemon.fromJson(pokemonMap);
      pokemons.add(pokemonObj);
    }

    return pokemons;
  }
}
