import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon.dart';
import 'package:flutter_pokedex/screen/datails/detail_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTab})
      : super(key: key);

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].name),
              onTap: () => onItemTab(
                  '/details', DetailArguments(name: list[index].name)),
            );
          }),
    );
  }
}
