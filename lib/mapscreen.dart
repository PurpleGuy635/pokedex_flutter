import 'package:flutter/material.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({Key? key}) : super(key: key);

  @override
  State<Mapscreen> createState() => StateTest();
}

class StateTest extends State<Mapscreen> {
  int _counter = 0;
  Widget body = Image.asset("./asset/Kanto.png");

  void _incrementCounter() {
    setState(() {
      if (_counter == 6) {
        _counter = -1;
      }
      _counter++;
    });
    update();
  }

  update() {
    setState(() {
      if (_counter == 0) {
        body = Image.asset("./asset/Kanto.png");
      }
      if (_counter == 1) {
        body = Image.asset("./asset/Johto.png");
      }
      if (_counter == 2) {
        body = Image.asset("./asset/hoen.png");
      }
      if (_counter == 3) {
        body = Image.asset("./asset/sinnoh.png");
      }
      if (_counter == 4) {
        body = Image.asset("./asset/Unys.png");
      }
      if (_counter == 5) {
        body = Image.asset("./asset/Kalos.png");
      }
      if (_counter == 6) {
        body = Image.asset("./asset/alola.png");
      }
    });
  }

  void _decrementCounter() {
    setState(() {
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
      appBar: AppBar(title: Text("MAP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pokedex'),
            const Text(
              'Ce chiffre correspond à la région du pokedex :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: body,
            )
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
              child: Text('MAP'),
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
                Navigator.pop(context);
                update();
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
