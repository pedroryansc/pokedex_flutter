import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configurations extends StatefulWidget {
  const Configurations({super.key});

  @override
  State<Configurations> createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {
  int? _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.white, height: 1),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Text(
                    "IMAGEM DO POKÉMON",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(200, 255, 255, 255),
                    ),
                    textAlign: .start,
                  ),
                ],
              ),
            ),
            RadioGroup(
              groupValue: _radioValue,
              onChanged: (int? value) async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                prefs.setInt("opcaoSprite", value!);

                setState(() {
                  _radioValue = value;
                });
              },
              child: Column(
                children: [
                  // Futuramente, apresentar as opções de Radio como um ListView.builder
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Mostrar pixel art",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Radio(
                        value: 1,
                        activeColor: Colors.lightGreenAccent,
                        overlayColor: WidgetStateProperty.all(
                          Colors.lightGreenAccent.withAlpha(50),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Mostrar arte oficial",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Radio(
                        value: 2,
                        activeColor: Colors.lightGreenAccent,
                        overlayColor: WidgetStateProperty.all(
                          Colors.lightGreenAccent.withAlpha(50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
