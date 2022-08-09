import 'package:flutter/material.dart';
import 'package:flutter_pokedex/errors/failure.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/screen/datails/detail_page.dart';
import 'package:flutter_pokedex/widgets/error.dart';
import 'package:flutter_pokedex/widgets/loading.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);

  final DetailArguments arguments;
  final IPokemonRepository repository;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  Pokemon? _pokemon;
  late Future<List<Pokemon>> _future;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.6,
      initialPage: widget.arguments.index,
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (_pokemon == null) {
            _pokemon = widget.arguments.pokemon;
          } else {}

          return DetailsPage(
            controller: _controller,
            list: snapshot.data!,
            pokemon: _pokemon!,
            onBack: widget.onBack,
            onChangedPokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
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
