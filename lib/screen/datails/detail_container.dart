import 'package:flutter/material.dart';
import 'package:flutter_pokedex/errors/failure.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/screen/datails/detail_page.dart';
import 'package:flutter_pokedex/widgets/error.dart';
import 'package:flutter_pokedex/widgets/loading.dart';

class DetailArguments {
  DetailArguments({required this.name});
  final String name;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
  }) : super(key: key);

  final DetailArguments arguments;
  final IPokemonRepository repository;

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
          return DetailsPage(
            name: arguments.name,
            list: snapshot.data!,
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
