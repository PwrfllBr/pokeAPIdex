import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_card_widget.dart';

class PokedexMainScreen extends StatefulWidget {
  const PokedexMainScreen({super.key});

  @override
  State<PokedexMainScreen> createState() => _PokedexMainScreenState();
}

class _PokedexMainScreenState extends State<PokedexMainScreen> {
  @override
  Widget build(BuildContext context) {
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
              child:  ListView.builder(
                itemCount: 5,
                
                itemBuilder: (context, index) {
                  int id = (index + 1);
                  return PokemonCard(pokeId: id);
                  }
                ),
            ),
          ],
        ),
      ),
    );
  }
}