import 'package:flutter/material.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex - Menu"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                //image: AssetImage("./asset/dracaufeu.png"), fit: BoxFit.cover)),
                image: AssetImage("./asset/images/alola.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              child: (Image.asset(
                "./asset/images/Logo.png",
                height: 100,
                width: 100,
              )),
            ),
            Positioned(
              top: 10,
              left: 1000,
              child: (Image.asset(
                "./asset/images/Logo.png",
                height: 100,
                width: 100,
              )),
            ),
            Column(
              children: [
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Positioned(
                      right: 100,
                      top: 10,
                      child: (Image.asset(
                        "./asset/images/Logo.png",
                        height: 100,
                        width: 100,
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
