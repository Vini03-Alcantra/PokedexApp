import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../consts/consts_api.dart';
import '../../consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String nome;
  final int index;
  final Color color;
  final String num;
  final List<String> types;

  const PokeItem({Key key, this.nome, this.index, this.color, this.num, this.types})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            //alignment: Alignment.bottomRight,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  child: Image.asset(
                    ConstsApp.whitePokeball,
                    height: 100,
                    width: 100,
                  ),
                  opacity: 0.2
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CachedNetworkImage(
                  height: 90,
                  width: 90,
                  placeholder: (context, url) => Container(
                    color: Colors.transparent,
                  ),
                  imageUrl: "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png"
                ),
              ),
              Text(nome, style: TextStyle(
                fontFamily: "Google",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
             )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: ConstsAPI.getColorType(type: types[0]),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )
          ),
      ),
    );
  }
}
