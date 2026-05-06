import "pokemon.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

class PokeAPI {
  static Future<String> get lerJSON async {
    return await rootBundle.loadString("assets/json/pokemons.json");
  }

  /*
  static List<Pokemon> get getPokemons async {
    final pokemonMap = jsonDecode(PokeAPI.lerJSON);

    return pokemonMap;
  }
  */
}
