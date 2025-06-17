import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_type_widget.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokeId
  });

  final int pokeId;

  String getPokeImgUrl(int id){
    String pokemonid = id.toString().padLeft(3, '0');

    return 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/$pokemonid.png';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 130,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 117, 227, 240),
          borderRadius: BorderRadius.circular(15),
          boxShadow: List<BoxShadow>.generate(
            3,
            (index) => BoxShadow(
            color: const Color.fromARGB(66, 0, 0, 0),
            blurRadius: 2 * (index + 1),
            offset: Offset(0,2 * (index + 1))
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bulbasaur', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    PokemonTypeWidget(type: 'Grass', typeColor: Color.fromARGB(255, 85, 190, 76),),
                    SizedBox(width: 8,),
                    PokemonTypeWidget(type: 'Poison', typeColor: Color.fromARGB(255, 102, 81, 204)),
                  ],
                )
              ],
            ),
            Image.network(getPokeImgUrl(pokeId),
              height: 90,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}