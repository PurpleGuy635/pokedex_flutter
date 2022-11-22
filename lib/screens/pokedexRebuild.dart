import 'dart:async';
import 'dart:developer';

import 'package:fluttedex_api/main.dart';
import 'package:fluttedex_api/objects/Pok%C3%A9DropDown.dart';
import 'package:flutter/material.dart';
import '../api/API.dart';

const String linkApi = 'https://pokeapi.co/api/v2/pokemon/';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  API api = API(linkApi);
  var response = null;
  late PokeDropDown pokeDropDown;

  init() async {
    Timer(const Duration(seconds: 3), () => {response = 1});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget children;
        if (response == null) {
          children = Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    strokeWidth: 7,
                  )
                ]),
          );
        } else {
          children = Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('data')]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [dropDownBuilder()],
              )
            ]),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("data"),
          ),
          body: children,
        );
      },
    );
  }

  Widget dropDownBuilder() {
    pokeDropDown = PokeDropDown();
    log(pokeDropDown.toString());

    return pokeDropDown.build();
  }
}
