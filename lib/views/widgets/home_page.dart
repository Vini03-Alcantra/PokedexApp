import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/views/PokeDetail/poke_detail_page.dart';
import 'package:pokedex/views/widgets/app_bar_home.dart';
import 'package:pokedex/views/widgets/poke_item.dart';
import '../../models/pokeapi.dart';
import '../../stores/pokeapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore _pokemonStore;

  @override 
  void initState(){
    super.initState();
    _pokemonStore = GetIt.instance<PokeApiStore>();
    if(_pokemonStore.pokeAPI == null){
      _pokemonStore.fetchPokemonList();
    }
  }

  Widget build(BuildContext context) {            
    _pokemonStore.fetchPokemonList();
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(   
      backgroundColor: Colors.white,   
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.7),
            left: screenWidth - (240 / 1.6),            
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1
            )
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,                  
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: "ListaHomePage",
                      builder: (BuildContext context){
                        PokeAPI _pokeApi = _pokemonStore.pokeAPI;
                        return (_pokeApi != null) ?
                        AnimationLimiter(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(12),
                            addAutomaticKeepAlives: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: _pokemonStore.pokeAPI.pokemon.length,                            
                            itemBuilder: (context, index){
                              Pokemon pokemon = _pokemonStore.getPokemon(index: index);
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: GestureDetector(
                                    child: PokeItem(
                                      types: pokemon.type,
                                      index: index,
                                      nome: pokemon.name,
                                      num: pokemon.numero,
                                    ),
                                    onTap: (){
                                      _pokemonStore.setPokemonAtual(index: index);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context){
                                          return PokeDetailPage(
                                            index: index
                                          );                                            
                                        },
                                        fullscreenDialog: true
                                      )
                                      );
                                    },
                                  )
                                )
                              );
                            }
                          ),  
                        ): Center(child: CircularProgressIndicator());
                      },
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}