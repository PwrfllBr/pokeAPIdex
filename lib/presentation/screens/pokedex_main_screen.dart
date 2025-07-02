import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_card_widget.dart';
import 'package:pokedex_app/providers/pokemon_detail_provider.dart';
import 'package:pokedex_app/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class PokedexMainScreen extends StatefulWidget {
  const PokedexMainScreen({super.key});

  @override
  State<PokedexMainScreen> createState() => _PokedexMainScreenState();
}

class _PokedexMainScreenState extends State<PokedexMainScreen> {
  final ScrollController scrollController = ScrollController();

  //final PokemonProvider pokemonProvider = PokemonProvider();
  //final PokemonDetailProvider pokeDetailProvider =PokemonDetailProvider();
  
  @override
  void initState(){
    super.initState();
    scrollController.addListener(onScroll);
  }

  void onScroll(){
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      final pokemonProvider = Provider.of<PokemonProvider>(context, listen: false);
      if (!pokemonProvider.isLoading && pokemonProvider.hasMore) {
        pokemonProvider.fetchPokemons(loadMore: true);
      }
    }
  }

  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonDetailProvider = context.read<PokemonDetailProvider>(); 

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 239, 245),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Text('Pokedex',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Consumer<PokemonProvider>(
                builder: (context, pokemonProvider, child){
                  if(pokemonProvider.isLoading && pokemonProvider.pokemonList.isEmpty){
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  if(pokemonProvider.pokemonList.isEmpty){
                    return const Center(child: Text('No Pokemon :('),);
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: pokemonProvider.pokemonList.length + (pokemonProvider.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == pokemonProvider.pokemonList.length) {
                        if (pokemonProvider.isLoading) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return const SizedBox.shrink(); //no more loading items
                        }
                      }

                      final pokemon = pokemonProvider.pokemonList[index];
                      return GestureDetector(
                        onTap: () {
                          pokemonDetailProvider.pickedPokemon = pokemon;
                          Navigator.pushNamed(context, "pokemonDetailsScreen");
                        },
                        child: PokemonCard(pokemon: pokemon)
                      );
                    }
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}