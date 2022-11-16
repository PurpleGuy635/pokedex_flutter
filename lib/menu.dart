import 'package:flutter/material.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex - Menu"),
      ),
      body: Center(
        /*HomeScreen container(){
        Positioned(
            height: 50,
            width: 50,
            right: 100,  
            top: 50,
            Image.asset("./asset/Kanto.png"),
              );
        }*/

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(bottom: 25)),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/route1');
                },
                child: const Text("Pokedex - MAP"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 75),
                )),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/route2');
              },
              child: const Text("Pokedex"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
