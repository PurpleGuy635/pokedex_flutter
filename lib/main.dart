import 'dart:async';

import 'package:flutter/material.dart';

import 'screens/menu.dart';
import 'screens/mapdex/mapscreen.dart';
import 'screens/pokédex/pokedexscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter pokedex'),
      routes: <String, WidgetBuilder>{
        '/route1': (BuildContext context) => Mapscreen(),
        '/route2': (BuildContext context) => const pokedexScreen(),
        //'/route3': (BuildContext context) => ThirdPage(title: 'Page 3'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 255, 22, 45),
        child: Image.asset("./asset/images/Logo.png"));
  }
}
