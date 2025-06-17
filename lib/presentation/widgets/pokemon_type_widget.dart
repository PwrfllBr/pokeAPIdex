import 'package:flutter/material.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({
    super.key,
    required this.type,
    required this.typeColor,
  });

  final String type;
  final Color typeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(type, style: TextStyle(fontWeight: FontWeight.w700),),),
    );
  }
}