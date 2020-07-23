import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';

class PokeDetailPage extends StatelessWidget {
  final int index;
  final String name;

  const PokeDetailPage({Key key, this.index, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _pokemonStore = Provider.of<PokeApiStore>(context);
    Pokemon _pokemon = _pokemonStore.getPokemon(index: this.index);    
    return Scaffold(
      backgroundColor: ConstsAPI.getColorType(type: _pokemon.type[0])
    );
  }
}