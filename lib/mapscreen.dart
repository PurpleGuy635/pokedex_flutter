import 'package:flutter/material.dart';

class mapscreen extends StatelessWidget {
  @override
  Widget build(BuildContextcontext) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokedex - Map")),
      body: const Center(
          child: Text("Welcome to Map screen",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
