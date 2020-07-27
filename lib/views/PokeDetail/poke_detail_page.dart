import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;

  PokeDetailPage({Key key, this.index}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {  
  PageController _pageController;
  Pokemon _pokemon;
  PokeApiStore _pokemonStore;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: widget.index);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokemon = _pokemonStore.pokemonAtual;
  }

  @override
  Widget build(BuildContext context) {
    
    //Pokemon _pokemon = _pokemonStore.pokemonAtual;    
    var altura = MediaQuery.of(context).size.height;
    
    return Observer( 
      builder: (BuildContext context){
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Observer(  
              builder: (context){                
                return AppBar(
                  title: Opacity(
                    opacity: 0.0,
                    child: Text(
                      _pokemon.name,
                      style: TextStyle(
                        fontFamily: "Google",
                        fontWeight: FontWeight.bold,
                        fontSize: 21
                      ),
                    ),
                  ),
                  elevation: 0, 
                  backgroundColor: _pokemonStore.corPokemon,
                  leading: IconButton(  
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite_border),            
                      onPressed: (){}
                    )
                  ],
                );
              }
            ),
          ),         
          body: Stack(
            children: <Widget>[
              Observer(  
                builder: (context){
                  return Container(  
                    color: _pokemonStore.corPokemon,
                  );
                }
              ),              
              Container(            
                height: altura / 3,
              ),
              SlidingSheet(
                elevation: 8,
                cornerRadius: 16,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [400, double.infinity],
                  //snappings: [0.7, 1.0],
                  positioning: SnapPositioning.pixelOffset,
                ),
                builder: (context, state) {
                  return Container(
                    height: altura,
                    child: Center(
                      child: Text(
                        'This is the content of the sheet',                    
                      ),
                    ),
                  );
              },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Positioned(                                
                  child: SizedBox(
                    height: 150,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index){
                        _pokemonStore.setPokemonAtual(index: index);
                      },
                      itemCount: _pokemonStore.pokeAPI.pokemon.length,
                      itemBuilder: (BuildContext context, int index){
                        Pokemon _pokeitem = _pokemonStore.getPokemon(index: index);
                        return CachedNetworkImage(
                          width: 60,
                          height: 60,
                          placeholder: (context, count) => Container(
                            color: Colors.transparent
                          ),
                          imageUrl: "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokeitem.numero}.png"
                        );
                      }
                    ),
                  )
                ),
              )
            ],
          ),
        );
      },
    );
  }
}