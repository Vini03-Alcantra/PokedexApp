import 'package:mobx/mobx.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = PokeApiStoreBase with _$PokeApiStore;

abstract class PokeApiStoreBase with Store{
  @observable
  int value = 0;
  
  @action
  increment(){}
}