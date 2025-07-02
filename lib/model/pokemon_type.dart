import 'package:flutter/material.dart';

class PokemonType {
  final String name;
  final Color color;
  final Color altColor1;
  final Color altColor2;

  PokemonType({
    required this.name,
    required this.color,
    required this.altColor1,
    required this.altColor2,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json){
    final String typeName = json['name'];
    return PokemonType(
      name: typeName,
      color: _getTypeColor(typeName),
      altColor1: _getTypeAltColor1(typeName),
      altColor2: _getTypeAltColor2(typeName),
      );
  }
  
  static Color _getTypeColor(String typeName) {
    switch (typeName.toLowerCase()) {
      case 'normal': return const Color.fromARGB(255, 168, 168, 120);
      case 'fire': return const Color.fromARGB(255, 242, 99, 51);
      case 'water': return const Color.fromARGB(255, 104, 145, 240);
      case 'grass': return const Color.fromARGB(255, 120, 200, 80);
      case 'electric': return const Color.fromARGB(255, 240, 192, 0);
      case 'ice': return const Color.fromARGB(255, 152, 216, 216);
      case 'fighting': return const Color.fromARGB(255, 192, 48, 40);
      case 'poison': return const Color.fromARGB(255, 160, 64, 160);
      case 'ground': return const Color.fromARGB(255, 216, 187, 107);
      case 'flying': return const Color.fromARGB(255, 168, 144, 240);
      case 'psychic': return const Color.fromARGB(255, 248, 88, 136);
      case 'bug': return const Color.fromARGB(255, 169, 184, 32);
      case 'rock': return const Color.fromARGB(255, 184, 161, 56);
      case 'ghost': return const Color.fromARGB(255, 113, 88, 152);
      case 'dragon': return const Color.fromARGB(255, 114, 56, 248);
      case 'steel': return const Color.fromARGB(255, 182, 182, 196);
      case 'dark': return const Color.fromARGB(255, 112, 88, 72);
      case 'fairy': return const Color.fromARGB(255, 238, 153, 171);
      default: return Colors.grey;
    }
  }

  static Color _getTypeAltColor1(String typeName) {
    switch (typeName.toLowerCase()) {
      case 'normal': return const Color.fromARGB(255, 223, 223, 159);
      case 'fire': return const Color.fromARGB(255, 240, 128, 48);
      case 'water': return const Color.fromARGB(255, 97, 181, 255);
      case 'grass': return const Color.fromARGB(255, 112, 233, 116);
      case 'electric': return const Color.fromARGB(255, 255, 215, 53);
      case 'ice': return const Color.fromARGB(255, 171, 244, 244);
      case 'fighting': return const Color.fromARGB(255, 245, 73, 64);
      case 'poison': return const Color.fromARGB(255, 226, 109, 226);
      case 'ground': return const Color.fromARGB(255, 233, 211, 113);
      case 'flying': return const Color.fromARGB(255, 173, 167, 255);
      case 'psychic': return const Color.fromARGB(255, 255, 132, 169);
      case 'bug': return const Color.fromARGB(255, 215, 233, 54);
      case 'rock': return const Color.fromARGB(255, 189, 170, 89);
      case 'ghost': return const Color.fromARGB(255, 178, 154, 213);
      case 'dragon': return const Color.fromARGB(255, 136, 96, 238);
      case 'steel': return const Color.fromARGB(255, 206, 206, 228);
      case 'dark': return const Color.fromARGB(255, 133, 118, 108);
      case 'fairy': return const Color.fromARGB(255, 238, 184, 196);
      default: return Colors.grey;
    }
  }
  static Color _getTypeAltColor2(String typeName) {
    switch (typeName.toLowerCase()) {
      case 'normal': return const Color.fromARGB(220, 254, 254, 205);
      case 'fire': return const Color.fromARGB(220, 248, 153, 85);
      case 'water': return const Color.fromARGB(220, 149, 206, 255);
      case 'grass': return const Color.fromARGB(220, 146, 255, 150);
      case 'electric': return const Color.fromARGB(233, 255, 227, 102);
      case 'ice': return const Color.fromARGB(220, 198, 255, 255);
      case 'fighting': return const Color.fromARGB(220, 255, 113, 105);
      case 'poison': return const Color.fromARGB(220, 255, 164, 255);
      case 'ground': return const Color.fromARGB(220, 255, 238, 163);
      case 'flying': return const Color.fromARGB(220, 198, 194, 255);
      case 'psychic': return const Color.fromARGB(220, 255, 169, 195);
      case 'bug': return const Color.fromARGB(220, 243, 255, 132);
      case 'rock': return const Color.fromARGB(220, 189, 170, 89);
      case 'ghost': return const Color.fromARGB(220, 217, 198, 244);
      case 'dragon': return const Color.fromARGB(220, 176, 145, 255);
      case 'steel': return const Color.fromARGB(220, 240, 240, 252);
      case 'dark': return const Color.fromARGB(220, 175, 160, 149);
      case 'fairy': return const Color.fromARGB(220, 255, 220, 227);
      default: return Colors.grey;
    }
  }
}