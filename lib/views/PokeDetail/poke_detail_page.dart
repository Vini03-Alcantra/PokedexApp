import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatelessWidget {
  final int index;
  

  Color _corPokemon;
  
  PokeDetailPage({Key key, this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _pokemonStore = Provider.of<PokeApiStore>(context);
    Pokemon _pokemon = _pokemonStore.getPokemon(index: this.index);    
    _corPokemon = ConstsAPI.getColorType(type: _pokemon.type[0]);
    var altura = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: _corPokemon,
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
      ),
      backgroundColor: _corPokemon,
      body: Stack(
        children: <Widget>[
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
          Positioned(                      
            child: SizedBox(
              height: 120,
              child: PageView.builder(
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
          )
        ],
      ),
    );
  }
}