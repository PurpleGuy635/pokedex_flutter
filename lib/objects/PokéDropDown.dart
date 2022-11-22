import 'package:fluttedex_api/utils/generateList.dart';
import 'package:flutter/material.dart';

class PokeDropDown {
  late List<DropdownMenuItem> items;
  var selectedValue;

  PokeDropDown(){
    var list = GeneratePokeList('Chosis ton pokémon');
    items = list.initList(); 
  }

  Widget build() {
    return DropdownButton(items: items, onChanged: onChanged);
  }

  void onChanged(value) {
    selectedValue = value;
  }
}