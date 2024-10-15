import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rickandmorty/views/screens/characters_view/characters_request.dart';
import 'package:rickandmorty/views/widgets/character_card.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersRequest>().getCharacters();
  }

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
              Consumer<CharactersRequest>(
                builder: (context, requestModel, child){
                  if (requestModel.charactersModel == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                   return Flexible(
                     child: ListView.builder(
                        itemCount:
                            requestModel.charactersModel!.characters.length,
                        itemBuilder: (context, index) {
                          final characterModel =
                              requestModel.charactersModel!.characters[index];
                          return CharacterCard(characterModel: characterModel);
                        },
                      ),
                   );
                  }
                },
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
