import 'package:flutter/material.dart';
import 'package:flutter_pokedex/errors/failure.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/screen/home/home.dart';
import 'package:flutter_pokedex/screen/home/home_error.dart';
import 'package:flutter_pokedex/screen/home/home_loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);

  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      }),
    );
  }
}
