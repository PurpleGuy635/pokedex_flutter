// ignore_for_file: camel_case_types, slash_for_doc_comments, unrelated_type_equality_checks

///////////////////////////////////////////////////
////////// OLD DEAD CODE DO NOT USE IT ! //////////
////////// USE "pokedexRebuild" INSTEAD  //////////
///////////////////////////////////////////////////


import 'dart:developer';

import 'package:fluttedex_api/utils/generateList.dart';
import 'package:flutter/material.dart';
import '../api/callAPI.dart';
import '../objects/pokemon.dart';

GeneratePokeList Pokelist = GeneratePokeList('Choisi ton pokémon');

class pokedexScreen extends StatefulWidget {
  const pokedexScreen({super.key});

  @override
  State<pokedexScreen> createState() => _pokedexScreenState();
}

class _pokedexScreenState extends State<pokedexScreen> {
  List<String> list = ['Choisi ton pokémon'];
  late String dropdownValue = list.first;

  late Widget selector;
  late Widget pokeToScreen;
  late Widget loader;
  // API api = API('');
  late Pokemon pokemon;

  bool hasloaded = false;
  bool hasPokemon = false;

  late Widget body;
  Widget downbody = Container();


  // choosed(String id) async {
  //   // await api.call(id);

  //   // var temp = api.getPokemon();

  //   pokemon = Pokemon(temp['name'], temp['id']);
  //   log(pokemon.getName());

  //   if (pokemon != 'Choisi ton pokémon') {
  //     log(pokemon.toString());

  //     setState(() {
  //       log(pokemon.getSprite());
  //       downbody = Image.network(pokemon.getSprite());
  //     });
  //   }
  // }

  Image buildImage(String src){
    if (pokemon != null){
      return Image.network(src);
    }else {
      return Image.network('') ;
    }
  }

  init() {
    Pokelist.initList();
    list = Pokelist.getList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot list) {
          List<Widget> children;
          if (this.list.isNotEmpty) {
            children = <Widget>[
             const Text(style: TextStyle(fontSize: 25), 'Choisit un pokémon'),
             Column(
              mainAxisAlignment: MainAxisAlignment.center
              ,children: [buildDropDown(), buildImage(pokemon.getSprite())],),
            ];
          } else {
             children = const <Widget>[
              SizedBox(
                  width: 60, height: 60, child: CircularProgressIndicator())
            ];
          }
          return Scaffold(
            appBar: AppBar(title: const Text('Pokédex')),
        body: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,),
        ),
          );
        });
  }

  Widget scaffold() {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [body, downbody],
          ),
        );
  }

  Widget buildDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.blueAccent),
      underline: Container(
        height: 2.5,
        color: Colors.redAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        if (value != list.first) {
          // choosed(Pokelist.whosThatPokemon(value!).toString());
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
