import 'package:flutter/material.dart';
import 'package:rickandmorty/views/widgets/character_card.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _searchinputwidget(context),
              const CharacterCard(
                image : 'https://rickandmortyapi.com/api/character/avatar/812.jpeg',
                name : 'Deformed Morty',
                origin: 'Dünya - (c137)',
                status : 'Yasiyor',
                type : 'Insanimsi',
              ),
              const CharacterCard(
                image : 'https://rickandmortyapi.com/api/character/avatar/812.jpeg',
                name : 'Deformed Morty',
                origin: 'Dünya - (c137)',
                status : 'Yasiyor',
                type : 'Insanimsi',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchinputwidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Karakterlerde Ara',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
