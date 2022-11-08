import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContextcontext) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: const Center(
          child: Text("Welcome to Pokedex",
              style: TextStyle(color: Colors.black, fontSize: 30))),
    );
  }
}
