import 'package:flutter/material.dart';
import 'package:pokedex_app/providers/pokemon_detail_provider.dart';
import 'package:pokedex_app/providers/pokemon_provider.dart';
import 'package:pokedex_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonProvider>(create: (_) => PokemonProvider()),
        ChangeNotifierProvider<PokemonDetailProvider>(create: (_) => PokemonDetailProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: AppRoutes.getRoutes,
        initialRoute: AppRoutes.initialRoute,
      ),
    );
  }
}