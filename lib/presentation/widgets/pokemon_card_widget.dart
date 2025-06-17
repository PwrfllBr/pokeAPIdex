import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_type_widget.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: 130,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 73, 208, 176),
        borderRadius: BorderRadius.circular(15),
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
          Image.network('https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
            )
        ],
    
      ),
    );
  }
}