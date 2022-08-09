import 'package:flutter/material.dart';

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
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: 200,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(),
            ),
            SizedBox(
              height: 150,
              width: 500,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list
                    .map((e) => Image.network(
                          e.image,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.contain,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
