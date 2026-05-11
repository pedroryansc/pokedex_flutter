import 'package:flutter/material.dart';

import "pokedex.dart";
import "configurations.dart";
import "pokemon_page.dart";

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
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 111, 97),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 111, 97),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(fontSize: 30, color: Colors.white),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.lightGreenAccent;
            } else {
              return Colors.white;
            }
          }),
          overlayColor: WidgetStateProperty.all(
            Colors.lightGreenAccent.withAlpha(50),
          ),
        ),
      ),
      home: const Pokedex(),
      routes: {
        "/configurations": (context) => Configurations(),
        "/pokemon": (context) => PokemonPage(),
      },
    );
  }
}
