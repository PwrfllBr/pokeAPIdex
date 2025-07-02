import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_type_widget.dart';
import 'package:pokedex_app/utils/string_extension.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  // String getPokeImgUrl(int id){
  //   String pokemonid = id.toString().padLeft(3, '0');

  //   return 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/$pokemonid.png';
  // }

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
                Text(
                  pokemon.name.capitalize(),
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,),
                ),
                SizedBox(height: 10,),
                Row(
                  children: pokemon.types.map((type) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: PokemonTypeWidget(type: type.name, typeColor: type.color))
                  ).toList(), 
                ),
              ],
            ),
            Image.network(
              pokemon.imageUrl,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace){
                return const Icon(Icons.error);
              },
            )
          ],
        ),
      ),
    );
  }
}