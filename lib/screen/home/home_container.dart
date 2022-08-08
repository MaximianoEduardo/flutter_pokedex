import 'package:flutter/material.dart';
import 'package:flutter_pokedex/errors/failure.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/screen/datails/detail_container.dart';
import 'package:flutter_pokedex/screen/home/home.dart';
import 'package:flutter_pokedex/widgets/error.dart';
import 'package:flutter_pokedex/widgets/loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);

  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onItemTab: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return Error(error: (snapshot.error as Failure).message!);
        }

        return Container();
      }),
    );
  }
}
