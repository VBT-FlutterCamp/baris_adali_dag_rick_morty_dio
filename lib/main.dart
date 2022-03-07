import 'package:dio_networking/rick_morties/rick_morty.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Networking',
      home: RickMorty(),
    );
  }
}
