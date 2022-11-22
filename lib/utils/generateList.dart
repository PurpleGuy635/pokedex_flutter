import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' as convert;

class GeneratePokeList {
  List<String> list = [];
  late List<dynamic> map;
  bool generated = false;

  List<String> getList() {
    return list;
  }

  GeneratePokeList(String s) {
    list.add(s);
  }

  Future<String> getJson() {
    return rootBundle.loadString('./asset/lists/pokelist.json');
  }

  initList() async {
    if (generated) {
      log('List already generated..... Aborted :\'(');
      return;
    }
    map = convert.jsonDecode(await getJson());

    for (var element in map) {
      list.add(element['name'].toString());
    }

    log(list.length.toString());
    generated = true;
  }

  int whosThatPokemon(String? name) {
    int r = 0;
    for (var element in map) {
      if (name == element['name']) {
        r = element['id'];
      }
    }
    return r;
  }
}
