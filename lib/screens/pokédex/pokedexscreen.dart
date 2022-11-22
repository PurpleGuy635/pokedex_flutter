// ignore_for_file: camel_case_types, slash_for_doc_comments

import 'dart:developer';

import 'package:fluttedex_api/utils/generateList.dart';
import 'package:flutter/material.dart';
import '../../api/callAPI.dart';
import '../../objects/pokemon.dart';

GeneratePokeList Pokelist = GeneratePokeList('Choisi ton pokémon');

class pokedexScreen extends StatefulWidget {
  const pokedexScreen({super.key});

  @override
  State<pokedexScreen> createState() => _pokedexScreenState();
}

class _pokedexScreenState extends State<pokedexScreen> {
  //
  //----------------------VARIABLES
  //
  Icon icon = const Icon(Icons.favorite_border_outlined);

  List<String> list = ['Choisi ton pokémon'];
  late String dropdownValue = list.first;

  late Widget selector;
  late Widget pokeToScreen;
  late Widget loader;
  API api = API();
  late Pokemon pokemon;

  bool hasloaded = false;
  bool hasPokemon = false;

  late Widget body;
  Widget downbody = Container();
  Widget slidebody = Container();
  //
  //----------------------VARIABLES
  //

  createSelecterWidget() {
    selector = Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 25,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(style: TextStyle(fontSize: 25), 'Choisit un pokémon')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [buildDropDown()],
            ),
          ],
        ));
  }

  choosed(String id) async {
    await api.call(id);

    var temp = api.getPokemon();

    pokemon = Pokemon(temp['name'], temp['id']);
    log(pokemon.getName());

    if (pokemon != 'Choisi ton pokémon') {
      log(pokemon.toString());

      setState(() {
        log(pokemon.getSprite());
        downbody = Image.network(pokemon.getSprite());
      });
    }
  }

  init() {
    Pokelist.initList();
    list = Pokelist.getList();

    createSelecterWidget();

    body = selector;
  }

  @override
  Widget build(BuildContext context) {
    init();
    return scaffold();
  }

  /**
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(),
        builder: (BuildContext context, AsyncSnapshot list) {
          Widget children;
          if (list.hasData) {
            children = Scaffold(
              appBar: AppBar(
                title: const Text('Pokédex'),
              ),
            );
          } else {
            children = Column(
              children: const [Text('no data')],
            );
          }
          return Scaffold(
            body: scaffold(),
          );
        });
  }
  */

  Widget scaffold() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('pokédex'),
        ),
        backgroundColor: Colors.amberAccent,
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: icon,
                      onPressed: () {
                        if (icon ==
                            const Icon(Icons.favorite_border_outlined)) {
                          setState(() {
                            icon = const Icon(Icons.favorite);
                          });
                        } else {
                          setState(() {
                            icon = const Icon(Icons.favorite_border_outlined);
                          });
                        }
                      })
                ],
              ),
              body,
              downbody,
              slidebody,
            ],
          ),
        ));
  }

  Widget bottomBar() {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.class_),
        label: 'Mes pokémons',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.find_in_page),
        label: 'Pokédex',
      )
    ]);
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
          log(value);
        });
        if (value != list.first) {
          choosed(Pokelist.whosThatPokemon(value!).toString());
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
