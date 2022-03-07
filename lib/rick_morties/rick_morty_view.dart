import 'dart:html';

import 'package:flutter/material.dart';
import '../rick_morties/rick_morty_view_model.dart';

class RickMortyView extends RickMortyViewModel {
  final String nullImage =
      "https://rickandmortyapi.com/api/character/avatar/1.jpeg";

  bool isLoading = false;
  @override
  void initState() {
    fetchAllData();
    changeLoading();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeLoading();
          fetchAllData();
          changeLoading();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Dio Example'),
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(models[index].image ?? nullImage),
                  ),
                  title: Text(models[index].name ?? ''),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
