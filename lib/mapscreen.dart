import 'package:flutter/material.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({Key? key}) : super(key: key);

  @override
  State<Mapscreen> createState() => StateTest();
}

class StateTest extends State<Mapscreen> {
  int _counter = 0;
  int _like = 0;
  String info =
      "Il est l'une des régions imaginaires de la série jeux vidéo Pokémon. Présent dans les jeux vidéo Pokémon,Il a été conçu en se inspirant région japonais la Kanto qui comprend, en plus d'autres ville, Aussi la capitale du Japon, Tokyo.";
  String _region = "Kanto";
  String kanto = "Kanto";
  String johto = "Johto";
  String hoen = "Hoen";
  String sinnoh = "Sinnoh";
  String unys = "Unys";
  String kalos = "Kalos";
  String alola = "Alola";
  Widget body = Image.asset("./asset/images/Kanto.png");

  void _incrementCounter() {
    setState(() {
      update();
      if (_counter == 6) {
        _counter = -1;
      }
      _counter++;
    });
    update();
  }

  void _likeBtn() {
    setState(() {
      _like++;
    });
    update();
  }

  update() {
    setState(() {
      if (_counter == 0) {
        _region = kanto;
        body = Image.asset("./asset/images/Kanto.png");
      }
      if (_counter == 1) {
        _region = johto;
        body = Image.asset("./asset/images/Johto.png");
      }
      if (_counter == 2) {
        _region = hoen;
        body = Image.asset("./asset/images/hoen.png");
      }
      if (_counter == 3) {
        _region = sinnoh;
        body = Image.asset("./asset/images/sinnoh.png");
      }
      if (_counter == 4) {
        _region = unys;
        body = Image.asset("./asset/images/Unys.png");
      }
      if (_counter == 5) {
        _region = kalos;
        body = Image.asset("./asset/images/Kalos.png");
      }
      if (_counter == 6) {
        _region = alola;
        body = Image.asset("./asset/images/alola.png");
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      update();
      if (_counter == 0) {
        _counter = 7;
      }
      _counter--;
    });
    update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Map")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                style: TextStyle(
                    fontWeight: FontWeight.w600, height: 1, fontSize: 30),
                'Pokedex'),
            const Text(
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 1, fontSize: 20),
              'Cette région se nomme :',
            ),
            Text(
              '$_region',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: body,
            ),
            Text(
              '$info',
            ),
            FloatingActionButton(
              onPressed: _likeBtn,
              child: Icon(Icons.thumb_up),
            ),
            Text("Nombre de like : "
                "$_like"),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.navigate_before,
                  color: Colors.black,
                ),
                onPressed: () => _decrementCounter(),
              ),
              IconButton(
                icon: const Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                ),
                onPressed: () => _incrementCounter(),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Map'),
            ),
            ListTile(
              title: const Text('Retour'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Kanto'),
              onTap: () {
                _counter = 0;
                update();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Johto'),
              onTap: () {
                _counter = 1;
                Navigator.pop(context);
                update();
              },
            ),
            ListTile(
              title: const Text('Hoen'),
              onTap: () {
                _counter = 2;
                Navigator.pop(context);
                update();
              },
            ),
            ListTile(
              title: const Text('Sinnoh'),
              onTap: () {
                _counter = 3;
                Navigator.pop(context);
                update();
              },
            ),
            ListTile(
              title: const Text('Unys'),
              onTap: () {
                _counter = 4;
                Navigator.pop(context);
                update();
              },
            ),
            ListTile(
              title: const Text('Kalos'),
              onTap: () {
                _counter = 5;
                Navigator.pop(context);
                update();
              },
            ),
            ListTile(
              title: const Text('alola'),
              onTap: () {
                _counter = 6;
                Navigator.pop(context);
                update();
              },
            ),
          ],
        ),
      ),
    );
  }
}
