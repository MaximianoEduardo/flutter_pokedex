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
        body:
            CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
      SliverAppBar(
        pinned: true,
        elevation: 0,
        title: Text(pokemon.name),
        backgroundColor: pokemon.baseColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text('#${pokemon.num}')),
          )
        ],
        leading: IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      DetailListWidget(
        pokemon: pokemon,
        list: list,
        controller: controller,
        onChangePokemon: onChangedPokemon,
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                color: pokemon.baseColor,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
              ),
            ],
          ),
        ),
      )
    ]));

    // Stack(
    //   children: [
    //     // AppBarColor(
    //     //   pokemon: pokemon,
    //     //   onBack: onBack,
    //     // ),
    //
    //   ],
    // ));
  }
}
