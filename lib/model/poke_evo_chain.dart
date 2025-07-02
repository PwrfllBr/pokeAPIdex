class PokeEvoChain {
  final int id;
  final EvoStage chain;

  PokeEvoChain({
    required this.id,
    required this.chain,
  });

  factory PokeEvoChain.fromJson(Map<String, dynamic> json){
    return PokeEvoChain(
      id: json['id'],
      chain: EvoStage.fromJson(json['chain']),
    );
  }
}

class EvoStage {
  final String speciesName;
  final int speciesId;
  final bool isBaby;
  final List<EvoStage> evolvesTo;

  EvoStage({
    required this.speciesName,
    required this.speciesId,
    required this.isBaby,
    required this.evolvesTo,
  });

  factory EvoStage.fromJson(Map<String, dynamic> json){
    final speciesUrl = json['species']['url'] as String;
    final Uri uri = Uri.parse(speciesUrl);
    final String speciesIdString = uri.pathSegments[uri.pathSegments.length - 2];
    final int speciesId = int.parse(speciesIdString);

    return EvoStage(
      speciesName: json['species']['name'],
      speciesId: speciesId,
      isBaby: json['isBaby'],
      evolvesTo: (json['evolves_to'] as List)
          .map((e) => EvoStage.fromJson(e))
          .toList(),
      );
  }

  String getPokemonImageUrl(){
    String pokemonId = speciesId.toString().padLeft(3, '0');
    return 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/$pokemonId.png';
  }
}