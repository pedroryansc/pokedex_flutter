import "pokemon.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

class PokeAPI {
  static Future<String> lerJSON() async {
    return rootBundle.loadString("assets/json/pokemons.json");
  }

  /*
  static List<Pokemon> get getPokemons async {
    final pokemonMap = jsonDecode(PokeAPI.lerJSON);

    return pokemonMap;
  }
  */
}
