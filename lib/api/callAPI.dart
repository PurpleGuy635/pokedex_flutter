// ignore_for_file: non_constant_identifier_names
import 'dart:developer';
import 'package:fluttedex_api/objects/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class API {
  ///
  ///Instancier l'api et appeler la méthode call avec comme paramètre un id.
  ///Instance the API and call "call" method with int id parameter
  ///
  final String _URL = 'https://pokeapi.co/api/v2/pokemon/';
  late Map<String, dynamic> _pokemons;

  Map<String, dynamic> getPokemon() {
    if (_pokemons == null) {
      return {"name": "null", "id": 0};
    }
    return _pokemons;
  }

  Future<List<String>> call(String id) async {
    /**
     * @RETURN : Array pokemon : retourne un pokémon et tous ses attributs. 
     * // Return pokemon with all his attributes
     * 
     * Appelle l'api pokéapi avec les paramètres par defaut (Limite = 20).
     * Call pokeAPI
     */

    var response = await http.get(Uri.parse('$_URL$id/'));
    if (response.statusCode == 200) {
      _pokemons = convert.jsonDecode(response.body);
      return [
        _pokemons['name'],
        _pokemons['id'].toString(),
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${_pokemons['id']}.png"
      ];
    } else {
      log('url testée : ##' + '$_URL$id/');
      log('impossible de consommer l\'api code erreur : ${response.statusCode}');
    }
    return ['-1'];
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
