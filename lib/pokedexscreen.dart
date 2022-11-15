import 'package:flutter/material.dart';
import 'api/callAPI.dart';

class pokedexscreen extends StatelessWidget {
  @override
  Widget build(BuildContextcontext) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokedex")),
      body: const Center(
          child: Text("Welcome to Pokedex",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
