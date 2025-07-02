import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/services/pokeapi_service.dart';

class PokemonProvider with ChangeNotifier {
  final PokeApiService apiService = PokeApiService();
  List<Pokemon> pokemonList = [];
  bool isLoading = false;
  int offset = 0;
  final int limit = 10;
  bool hasMore = true;

  PokemonProvider(){
    fetchPokemons();
  }

  Future<void> fetchPokemons({bool loadMore = false}) async {
    if (isLoading) return;
    if (!loadMore && pokemonList.isNotEmpty) return;

    isLoading = true;
    notifyListeners();

    final List<Pokemon> newPokemons = await apiService.getPokemonList(
      offset: offset,
      limit: limit
    );

    if (newPokemons.isEmpty) {
      hasMore = false;
    } else {
      pokemonList.addAll(newPokemons);
      offset += limit;
    }

    isLoading = false;
    notifyListeners();
  }
}