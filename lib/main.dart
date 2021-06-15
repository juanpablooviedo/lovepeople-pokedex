import 'package:app_pokedex/lista.dart';
import 'package:flutter/material.dart';

//! lovepeople_pokedex_(app_3)

// inicio do app

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Lista(),
    );
  }
}

