import 'package:flutter/material.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:pokedex/views/widgets/home_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: <SingleChildWidget>[
            Provider<PokeApiStore>(
              create: (_) => PokeApiStore(),
            )
          ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}