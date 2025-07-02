import 'package:flutter/material.dart';

class PokemonStat {
  final String name;
  final int baseStat;

  PokemonStat({
    required this.name,
    required this.baseStat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json){
    return PokemonStat(
      name: json['stat']['name'] as String,
      baseStat: json['base_stat'] as int,
    );
  }

  String get displayName {
    switch (name) {
      case 'hp': return 'HP';
      case 'attack': return 'Attack';
      case 'defense': return 'Defense';
      case 'special-attack': return 'Sp. Attack';
      case 'special-defense': return 'Sp. Defense';
      case 'speed': return 'Speed';
      default: return name;
    }
  }

  Color get statColor {
    if (baseStat >= 100) return Colors.green;
    if (baseStat >= 70) return Colors.lightGreen;
    if (baseStat >= 40) return Colors.amber;
    return Colors.redAccent;
  }
}