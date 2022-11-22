import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex - Menu"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./asset/images/drac.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 25)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/route1');
                    },
                    // ignore: sort_child_properties_last
                    child: const Text("Pokedex - MAP"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 75),
                    )),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/route2');
                  },
                  // ignore: sort_child_properties_last
                  child: const Text("Pokedex"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 75),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
