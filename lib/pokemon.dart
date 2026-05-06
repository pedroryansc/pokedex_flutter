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

  Pokemon(
    int id,
    String nome,
    String categoria,
    List<String> tipos,
    double altura,
    double peso,
    String descricao,
    String sprite,
    String som,
  ) {
    this.id = id;
    this.nome = nome;
    this.categoria = categoria;
    this.tipos = tipos;
    this.altura = altura;
    this.peso = peso;
    this.descricao = descricao;
    this.sprite = sprite;
    this.som = som;
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      json["id"],
      json["name"],
      json["genera"],
      json["types"],
      json["height"],
      json["weight"],
      json["flavor_text"],
      json["sprites"]["front_default"],
      json["cries"]["latest"],
    );
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

  set tipos(List<String> tipos) {
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
