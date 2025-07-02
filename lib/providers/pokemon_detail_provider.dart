import 'package:flutter/material.dart';
import 'package:pokedex_app/model/poke_evo_chain.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/model/pokemon_detail.dart';
import 'package:pokedex_app/services/pokeapi_service.dart';

class PokemonDetailProvider with ChangeNotifier {
  final PokeApiService apiService = PokeApiService();
  Pokemon? pickedPokemon;
  PokemonDetail? pokemonDetail;
  bool isLoading = false;

  Future<void> fetchPokemonDetails(int id) async{
    isLoading = true;
    notifyListeners();

    //data from /pokemon/{id}
    final Pokemon pokemonData = await apiService.getPokemonDetails(id);

    //data from /pokemon-species/{id}
    final Map<String, dynamic> speciesData = await apiService.getPokemonSpeciesDetails(id);

    //flavor text
    String flavorText = 'No description.';

    final List<dynamic> flavorTextEntries = speciesData['flavor_text_entries'];
    final engEntry = flavorTextEntries.firstWhere(
      (entry) => entry['language']['name'] == 'en',
      orElse: () => null,
    );

    if (engEntry != null) {
      flavorText = (engEntry['flavor_text'] as String).replaceAll('\n', ' ').replaceAll('\f', ' ');
    }
    
    //genus
    String genus = 'Unknown';

    final List<dynamic> generaEntries = speciesData['genera'];
    final engGenus = generaEntries.firstWhere(
      (entry) => entry['language']['name'] == 'en',
      orElse: () => null,
    );

    if (engGenus != null) {
      genus = engGenus['genus'] as String;
    }
    
    //egg group
    final List<String> eggGroups = (speciesData['egg_groups'] as List)
        .map((group) => (group['name'] as String))
        .toList();

    //evo chain
    PokeEvoChain? evoChain;
    final String evoChainUrl = speciesData['evolution_chain']['url'];
    evoChain = await apiService.getEvolutionChain(evoChainUrl);

    //putting everything together

    pokemonDetail = PokemonDetail(
      pokemon: pokemonData, 
      flavorText: flavorText, 
      genus: genus, 
      eggGroups: eggGroups,
      evoChain: evoChain);
    
    isLoading = false;
    notifyListeners();
  }
}