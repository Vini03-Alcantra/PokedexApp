// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on PokeApiStoreBase, Store {
  Computed<PokeAPI> _$pokeAPIComputed;

  @override
  PokeAPI get pokeAPI =>
      (_$pokeAPIComputed ??= Computed<PokeAPI>(() => super.pokeAPI,
              name: 'PokeApiStoreBase.pokeAPI'))
          .value;
  Computed<PokeAPI> _$corPokemonAtualComputed;

  @override
  PokeAPI get corPokemonAtual => (_$corPokemonAtualComputed ??=
          Computed<PokeAPI>(() => super.corPokemonAtual,
              name: 'PokeApiStoreBase.corPokemonAtual'))
      .value;

  final _$_pokeAPIAtom = Atom(name: 'PokeApiStoreBase._pokeAPI');

  @override
  PokeAPI get _pokeAPI {
    _$_pokeAPIAtom.reportRead();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI value) {
    _$_pokeAPIAtom.reportWrite(value, super._pokeAPI, () {
      super._pokeAPI = value;
    });
  }

  final _$pokemonAtualAtom = Atom(name: 'PokeApiStoreBase.pokemonAtual');

  @override
  Pokemon get pokemonAtual {
    _$pokemonAtualAtom.reportRead();
    return super.pokemonAtual;
  }

  @override
  set pokemonAtual(Pokemon value) {
    _$pokemonAtualAtom.reportWrite(value, super.pokemonAtual, () {
      super.pokemonAtual = value;
    });
  }

  final _$_corPokemonAtualAtom =
      Atom(name: 'PokeApiStoreBase._corPokemonAtual');

  @override
  dynamic get _corPokemonAtual {
    _$_corPokemonAtualAtom.reportRead();
    return super._corPokemonAtual;
  }

  @override
  set _corPokemonAtual(dynamic value) {
    _$_corPokemonAtualAtom.reportWrite(value, super._corPokemonAtual, () {
      super._corPokemonAtual = value;
    });
  }

  final _$PokeApiStoreBaseActionController =
      ActionController(name: 'PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$PokeApiStoreBaseActionController.startAction(
        name: 'PokeApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({int index}) {
    final _$actionInfo = _$PokeApiStoreBaseActionController.startAction(
        name: 'PokeApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({int index}) {
    final _$actionInfo = _$PokeApiStoreBaseActionController.startAction(
        name: 'PokeApiStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(index: index);
    } finally {
      _$PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$PokeApiStoreBaseActionController.startAction(
        name: 'PokeApiStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonAtual: ${pokemonAtual},
pokeAPI: ${pokeAPI},
corPokemonAtual: ${corPokemonAtual}
    ''';
  }
}
