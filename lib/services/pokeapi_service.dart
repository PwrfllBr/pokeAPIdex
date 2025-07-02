import 'dart:convert';
import 'package:pokedex_app/model/poke_evo_chain.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokeApiService {
  static const String baseUrl = 'http://pokeapi.co/api/v2';

  Future<List<Pokemon>> getPokemonList({int offset = 0, int limit = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?offset=$offset%limit=$limit'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      List<Pokemon> pokemonList = [];
      for (var item in results){
        Pokemon simplePokemon = Pokemon.fromJson(item);
        Pokemon detailedPokemon = await getPokemonDetails(simplePokemon.id);
        pokemonList.add(detailedPokemon);
      }
      return pokemonList;
    } else {
      throw Exception('No pokemon loaded. Failed.');
    }
  }


  Future<Pokemon> getPokemonDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon/$id/'));

    final Map<String, dynamic> data = json.decode(response.body);
    return Pokemon.fromDetailJson(data);
  }

  Future<Map<String, dynamic>> getPokemonSpeciesDetails(int id) async{
    final response = await http.get(Uri.parse('$baseUrl/pokemon-species/$id/'));

    return json.decode(response.body);
  }

  Future<PokeEvoChain> getEvolutionChain(String url) async {
    final response = await http.get(Uri.parse(url));

    final Map<String, dynamic> data = json.decode(response.body);
    return PokeEvoChain.fromJson(data);
  }
}