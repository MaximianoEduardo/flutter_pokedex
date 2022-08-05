import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/screen/home/home.dart';
import 'package:flutter_pokedex/screen/home/home_error.dart';
import 'package:flutter_pokedex/screen/home/home_loading.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const HomeLoading();
      }

      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        return HomePage(list: snapshot.data!);
      }

      if (snapshot.hasError) {
        return HomeError(error: snapshot.error.toString());
      }

      return Container();
    }));
  }
}
