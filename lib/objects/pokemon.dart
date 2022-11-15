class Pokemon {
  late String _name;
  late String _id;
  late String _sprite;

  Pokemon(name, id) {
    _name = name;
    _id = id.toString();
    _sprite =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
  }

  String getName() {
    return _name;
  }

  String getSprite() {
    return _sprite;
  }

  String getId() {
    return _id;
  }
}
