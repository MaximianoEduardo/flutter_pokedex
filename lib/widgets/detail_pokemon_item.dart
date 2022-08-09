import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class DetailsPokemonItem extends StatelessWidget {
  const DetailsPokemonItem({
    Key? key,
    required this.pokemon,
    required this.isDiff,
  }) : super(key: key);
  final isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: isDiff ? 0.5 : 1.0,
        child: Image.network(
          pokemon.image,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
          color: isDiff ? Colors.black.withOpacity(0.4) : null,
        ),
      ),
    );
  }
}
