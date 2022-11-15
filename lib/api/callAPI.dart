// ignore_for_file: non_constant_identifier_names
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API {
  ///
  ///Instancier l'api et appeler la méthode call avec comme paramètre un id.
  ///
  final String _URL = 'https://pokeapi.co/api/v2/pokemon/';
  late Map<String, dynamic> _pokemons;

  Map<String, dynamic> getPokemon() {
    return _pokemons;
  }

  Future<void> call(String id) async {
    /**
     * @RETURN : Array pokemon : retourne un pokémon et tous ses attributs.
     * 
     * Appelle l'api pokéapi avec les paramètres par defaut (Limite = 20).
     */

    var response = await http.get(Uri.parse('$_URL$id/'));
    if (response.statusCode == 200) {
      _pokemons = convert.jsonDecode(response.body);
      log(_pokemons.toString());
    } else {
      log('url testée : ##' + '$_URL$id/');
      log('impossible de consommer l\'api code erreur : ${response.statusCode}');
    }
  }

  Future<void> limitedCall(int limit) async {
    /**
     * @PARAMS : int limit : chiffre limitant le nombre de pokémons appelés.
     * 
     * @RETURN : Array _pokemons : tableau de _pokemons
     * 
     * Appelle l'api pokéapi avec une limite supérieur ou égale à 20.
     */
  }

  Future<void> offsetedlLimitedCall(int limit, int offset) async {
    /**
     * @PARAMS : int limit : chiffre limitant le nombre de pokémons appelés.
     * @PARAMS : int offset : indique la page recherchée.
     * 
     * @RETURN : Array _pokemons : tableau de _pokemons
     * 
     * Appelle l'api pokéapi avec une limite supérieur ou égale à 20 et dans une page spécifique.
     */
  }
}
