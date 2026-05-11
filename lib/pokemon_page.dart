import 'package:flutter/material.dart';
import "package:intl/intl.dart";

import "pokemon.dart";

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        alignment: .topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            spacing: 10,
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "${NumberFormat("'#'0000").format(pokemon.id)} | ${pokemon.nome} ",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.catching_pokemon, size: 30),
                      ],
                    ),
                  ),
                ),
              ),
              Card(child: Image.network(pokemon.sprites["arte_oficial"]!)),
              Card(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    spacing: 6,
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Tipo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            pokemon.tipos.join(", "),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Altura",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${pokemon.altura.toString().replaceAll(".", ",")} m",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Peso",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${pokemon.peso.toString().replaceAll(".", ",")} kg",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              pokemon.descricao,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ].expand((linha) => [linha, const Divider()]).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
