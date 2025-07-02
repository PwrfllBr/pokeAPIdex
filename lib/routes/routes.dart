import 'package:flutter/widgets.dart';
import 'package:pokedex_app/presentation/screens/pokedex_main_screen.dart';
import 'package:pokedex_app/presentation/screens/pokemon_details_screen.dart';
import 'package:pokedex_app/presentation/screens/rive_test_screen.dart';

class AppRoutes {
  static String initialRoute = 'riveTestScreen';
  static Map<String, Widget Function(BuildContext)> getRoutes = {
    'pokedexMainScreen': (BuildContext context) => PokedexMainScreen(),
    'pokemonDetailsScreen': (BuildContext context) => PokemonDetailsScreen(),
    'riveTestScreen': (BuildContext context) => RiveTestScreen(),
  };
}