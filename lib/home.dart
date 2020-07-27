import 'package:flutter/material.dart';
import 'package:pokedex/views/widgets/home_page.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
  }
}