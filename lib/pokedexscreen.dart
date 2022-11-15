// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:flutter/material.dart';
import 'api/callAPI.dart';
import 'objects/pokemon.dart';

class pokedexScreen extends StatefulWidget {
  const pokedexScreen({super.key});

  @override
  State<pokedexScreen> createState() => _pokedexScreenState();
}

class _pokedexScreenState extends State<pokedexScreen> {
  //with TickerProviderStateMixin {
  late Widget selector;
  late Widget pokeToScreen;
  late Widget loader;
  API api = API();
  late Pokemon pokemon;
  String selectedValue = 'choisi ton pokémon';

  // late AnimationController controller;

  bool hasloaded = false;
  bool hasPokemon = false;

  late List<DropdownMenuItem<String>> menuItems;

  late Widget body;

  /**
  @override
  void initState() {
    log('initiate');
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }
  */

  createSelecterWidget() {
    selector = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(style: TextStyle(fontSize: 25), 'Choisit un pokémon')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedValue,
                onChanged: (value) {},
                items: menuItems,
              )
            ],
          ),
        ],
      ),
    );
  }

/**
  createLoader() {
    loader = Container(
      child: CircularProgressIndicator(
        value: controller.value,
        semanticsLabel: 'Circular progress indicator',
      ),
    );
  }
*/
  choosed(String id) async {
    await api.call(id);

    var temp = api.getPokemon();

    pokemon = Pokemon(temp['name'], temp['id']);
    log(pokemon.getName());
  }

  init() {
    /**--------------- */
    //choosed(25);
    /**--------------- */
    initList();
    createSelecterWidget();
    //createLoader();

    body = selector;
  }

  initList() {
    menuItems = [
      DropdownMenuItem(child: Text("pikachu"), value: '25'),
      DropdownMenuItem(child: Text("Bulbizare"), value: "1"),
      DropdownMenuItem(child: Text("Tiplouf"), value: "2"),
      DropdownMenuItem(child: Text("Psykokwak"), value: "3"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        title: const Text('pokédex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [body],
        ),
      ),
    );
  }
}
