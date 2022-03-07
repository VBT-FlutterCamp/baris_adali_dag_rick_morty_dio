// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dio_networking/core/network/project_network_manager.dart';
// import 'package:dio_networking/rick_morties/rick_morty.dart';

// import 'package:flutter/material.dart';

// import 'model/character_model.dart';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_networking/rick_morties/rick_morty.dart';

import 'package:flutter/material.dart';

import '../core/network/project_network_manager.dart';
import 'model/character_model.dart';

abstract class RickMortyViewModel extends State<RickMorty> {
  final Dio dio = ProjectNetworkManager.instance.dio; //dio.get('/episode');

  List<CharacterModel> models = [];

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.EPISODE.rawValue);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseCharacterModel = BaseResponseCharacter.fromJson(data);
        models = baseCharacterModel.results ?? [];
      }
      //  else if (data is List) {
      //   models = data.map((e) => CharacterModel.fromJson(e)).toList();
      // }
    }

    setState(() {});
  }
}

enum ServicePath { EPISODE }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.EPISODE:
        return '/episode';
    }
  }
}
