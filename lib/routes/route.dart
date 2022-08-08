import 'package:flutter/material.dart';
import 'package:flutter_pokedex/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/screen/home/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);

  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(repository: repository);
            },
          );
        }
        // if (settings.name == '/details') {
        //   return MaterialPageRoute(
        //     builder: (context) {
        //       return HomeContainer(repository: repository);
        //     },
        //   );
        // }
        return null;
      },
    );
  }
}
