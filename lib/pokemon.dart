class Pokemon {
  int _id = 0;
  String _nome = "";
  String _categoria = "";
  List<String> _tipos = [];
  double _altura = 0;
  double _peso = 0;
  String _descricao = "";
  Map<String, String> _sprites = {};
  String _som = "";

  Pokemon.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap["id"] as int;
    nome = jsonMap["name"] as String;
    categoria = jsonMap["genus"] as String;
    tipos = jsonMap["types"] as List<dynamic>;
    altura = jsonMap["height"] as double;
    peso = jsonMap["weight"] as double;
    descricao = jsonMap["flavor_text"] as String;
    sprites = jsonMap["sprites"] as Map<String, dynamic>;
    som = jsonMap["cries"]["latest"] as String;
  }

  set id(int id) {
    _id = id;
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
    // Torna maiúscula a primeira letra do tipo e o adiciona a uma lista
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

  set descricao(String descricaoOriginal) {
    // Remove os caracteres de quebra de linha e avanço de página
    String descricaoFormatada = descricaoOriginal.replaceAll(
      RegExp(r"[\n\f]"),
      " ",
    );

    _descricao = descricaoFormatada;
  }

  set sprites(Map<String, dynamic> spritesTodos) {
    // Adiciona alguns sprites a um Map
    Map<String, String> sprites = {
      "pixel_art": spritesTodos["front_default"],
      "arte_oficial":
          spritesTodos["other"]["official-artwork"]["front_default"],
    };

    _sprites = sprites;
  }

  set som(String som) {
    _som = som;
  }

  int get id {
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

  Map<String, String> get sprites {
    return _sprites;
  }

  String get som {
    return _som;
  }

  @override
  String toString() {
    return "$id | $nome - $categoria | Tipo(s): $tipos | Altura: $altura m | Peso: $peso kg | $descricao | Sprite: $sprites | Som: $som";
  }
}
