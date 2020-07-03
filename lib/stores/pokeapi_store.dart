import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';

part 'pokeapi_store.g.dart';


class PokeApiStore = PokeApiStoreBase with _$PokeApiStore;

abstract class PokeApiStoreBase with Store{
  @observable
  PokeAPI pokeAPI;
  
  @action
  fetchPokemonList(){    
    loadPokeAPI().then((dynamic pokeList){
      pokeAPI = pokeList;
    });
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsAPI.pokeapiURL);
      var decodedJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodedJson);
    } catch (error) {
      print("Erro ao carregar lista");
      return null;
    }
  }
}