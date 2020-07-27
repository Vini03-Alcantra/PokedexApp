import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/home.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

void main(){ 
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<PokeApiStore>(PokeApiStore());
  return runApp(Home());
}