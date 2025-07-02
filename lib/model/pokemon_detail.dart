import 'package:pokedex_app/model/poke_evo_chain.dart';
import 'package:pokedex_app/model/pokemon.dart';

class PokemonDetail {
  final Pokemon pokemon;
  final String flavorText;
  final String genus;
  final List<String> eggGroups;
  final PokeEvoChain? evoChain;

  PokemonDetail({
    required this.pokemon,
    required this.flavorText,
    required this.genus,
    required this.eggGroups,
    this.evoChain
  });
}