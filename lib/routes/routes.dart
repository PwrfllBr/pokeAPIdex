import 'package:flutter/widgets.dart';
import 'package:pokedex_app/presentation/screens/pokedex_main_screen.dart';
import 'package:pokedex_app/presentation/screens/splash_screen.dart';

class AppRoutes {
  static String initialRoute = 'pokedexMainScreen';
  static Map<String, Widget Function(BuildContext)> getRoutes = {
    'splashScreen': (BuildContext context) => SplashScreen(),
    'pokedexMainScreen': (BuildContext context) => PokedexMainScreen(),
  };
}