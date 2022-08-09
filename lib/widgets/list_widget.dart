import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/detail_pokemon_item.dart';

import '../models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(),
            ),
            SizedBox(
              height: 300,
              width: 500,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list.map(
                  (e) {
                    bool diff = e.name != pokemon.name;
                    return DetailsPokemonItem(
                      isDiff: diff,
                      pokemon: e,
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
