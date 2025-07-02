import 'package:pokedex_app/model/pokemon_type.dart';
import 'package:pokedex_app/model/pokemonstat.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonType> types;
  final String imageUrl;
  final int? height;
  final int? weight;
  final List<String>? abilities;
  final List<PokemonStat>? stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
    this.height,
    this.weight,
    this.abilities,
    this.stats,
  });

  static String _getPokemonImageUrl(int id){
    final String pokemonId = id.toString().padLeft(3, '0');
    return 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/$pokemonId.png';
  }

  factory Pokemon.fromJson(Map<String, dynamic> json){
    final String url = json['url'];
    final Uri uri = Uri.parse(url);
    final String idString = uri.pathSegments[uri.pathSegments.length - 2];
    final int id = int.parse(idString);

    return Pokemon(
      id: id,
      name: json['name'],
      types: [],
      imageUrl: _getPokemonImageUrl(id),
    );
  }

  factory Pokemon.fromDetailJson(Map<String, dynamic> json){
    final List<PokemonType> types = (json['types'] as List)
        .map((typeJson) => PokemonType.fromJson(typeJson['type']))
        .toList();

    final List<String> abilities = (json['abilities'] as List)
        .map((abilityJson) => (abilityJson['ability']['name'] as String))
        .toList();

    final List<PokemonStat> stats = (json['stats'] as List)
        .map((statJson) => PokemonStat.fromJson(statJson))
        .toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      types: types,
      imageUrl: _getPokemonImageUrl(json['id']),
      height: json['height'],
      weight: json['weight'],
      abilities: abilities,
      stats: stats,
      );
  }
}