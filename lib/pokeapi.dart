import "pokemon.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

class PokeAPI {
  static Future<List<Pokemon>> get getPokemons async {
    final String pokemonJSON = await rootBundle.loadString(
      "assets/json/pokemons.json",
    );

    final pokemonMap = jsonDecode(pokemonJSON);

    return pokemonMap;

    /*
    Pokemon pokemonObj = Pokemon(
      pokemonMap["id"],
      pokemonMap["name"],
      pokemonMap["genera"],
      pokemonMap["types"],
      pokemonMap["height"],
      pokemonMap["weight"],
      pokemonMap["flavor_text"],
      pokemonMap["sprites"]["front_default"],
      pokemonMap["cries"]["latest"],
    );

    return pokemonObj;
    */
  }
}
