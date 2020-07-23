import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';

part 'pokeapi_store.g.dart';


class PokeApiStore = PokeApiStoreBase with _$PokeApiStore;

abstract class PokeApiStoreBase with Store{
  @observable
  PokeAPI _pokeAPI;
  
  @observable
  Pokemon pokemonAtual;

  @observable
  dynamic _corPokemonAtual;

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @computed 
  PokeAPI get corPokemonAtual => _corPokemonAtual;  

  @action
  fetchPokemonList(){    
    _pokeAPI = null;
    loadPokeAPI().then((dynamic pokeList){
      _pokeAPI = pokeList;
    });
  }

  @action
  getPokemon({int index}){
    return _pokeAPI.pokemon[index];
  }

  @action 
  setPokemonAtual({int index}){
    pokemonAtual = _pokeAPI.pokemon[index];
    _corPokemonAtual = ConstsAPI.getColorType(type: pokemonAtual.type[0]);
  }

  @action
  Widget getImage({String numero}){
    return CachedNetworkImage(
      placeholder: (context, url){
        return Container(
          color: Colors.transparent
        );
      },
      imageUrl: "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png"
    );
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