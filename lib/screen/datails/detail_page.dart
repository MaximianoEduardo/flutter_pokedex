import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widgets/list_widget.dart';
import '../../models/pokemon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.list,
    required this.pokemon,
    required this.onBack,
    required this.controller,
    required this.onChangedPokemon,
  }) : super(key: key);
  final List<Pokemon> list;
  final Pokemon pokemon;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangedPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
          elevation: 0,
          backgroundColor: pokemon.baseColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(child: Text('#${pokemon.num}')),
            )
          ],
        ),
        body: Stack(
          children: [
            // AppBarColor(
            //   pokemon: pokemon,
            //   onBack: onBack,
            // ),
            DetailListWidget(
              pokemon: pokemon,
              list: list,
              controller: controller,
              onChangePokemon: onChangedPokemon,
            )
          ],
        ));
  }
}
