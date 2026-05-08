import "package:intl/intl.dart";

class Pokemon {
  String _id = "";
  String _nome = "";
  String _categoria = "";
  List<String> _tipos = [];
  double _altura = 0;
  double _peso = 0;
  String _descricao = "";
  String _sprite = "";
  String _som = "";

  Pokemon.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap["id"] as int;
    nome = jsonMap["name"] as String;
    categoria = jsonMap["genus"] as String;
    tipos = jsonMap["types"] as List<dynamic>;
    altura = jsonMap["height"] as double;
    peso = jsonMap["weight"] as double;
    descricao = jsonMap["flavor_text"] as String;
    sprite = jsonMap["sprites"]["front_default"] as String;
    som = jsonMap["cries"]["latest"] as String;
  }

  set id(int id) {
    // Formata o ID para o padrão de apresentação. Ex: Bulbasaur -> #0001
    var formatter = NumberFormat("'#'0000");
    String idFormatado = formatter.format(id);
    _id = idFormatado;
  }

  set nome(String nome) {
    // Torna a primeira letra do nome maiúscula. Isto é feito porque, no JSON
    // copiado da PokéAPI, os nomes dos Pokémon vêm totalmente em minúsculo
    String nomeFormatado = nome[0].toUpperCase() + nome.substring(1);
    _nome = nomeFormatado;
  }

  set categoria(String categoria) {
    _categoria = categoria;
  }

  set tipos(List<dynamic> tiposMap) {
    List<String> tipos = [];

    for (Map<String, dynamic> tipoMap in tiposMap) {
      String tipo = tipoMap["type"]["name"];
      tipo = tipo[0].toUpperCase() + tipo.substring(1);
      tipos.add(tipo);
    }

    _tipos = tipos;
  }

  set altura(double altura) {
    // Converte de decímetros (dm) para metros (m)
    _altura = altura / 10;
  }

  set peso(double peso) {
    // Converte de hectogramas (hg) para quilogramas (kg)
    _peso = peso / 10;
  }

  set descricao(String descricao) {
    _descricao = descricao;
  }

  set sprite(String sprite) {
    _sprite = sprite;
  }

  set som(String som) {
    _som = som;
  }

  String get id {
    return _id;
  }

  String get nome {
    return _nome;
  }

  String get categoria {
    return _categoria;
  }

  List<String> get tipos {
    return _tipos;
  }

  double get altura {
    return _altura;
  }

  double get peso {
    return _peso;
  }

  String get descricao {
    return _descricao;
  }

  String get sprite {
    return _sprite;
  }

  String get som {
    return _som;
  }

  @override
  String toString() {
    return "$id | $nome - $categoria | Tipo(s): $tipos | Altura: $altura m | Peso: $peso kg | $descricao | Sprite: $sprite | Som: $som";
  }
}
