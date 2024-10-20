import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_request.dart';
import 'package:rickandmorty/views/widgets/card_list_view.dart';

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
    final viewModel = context.watch<CharactersRequest>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(height: 12),
              _searchinputwidget(context,viewModel: viewModel),
              viewModel.charactersModel == null
                  ? const CircularProgressIndicator.adaptive()
                  : CardListView(
                      characterModel: viewModel.charactersModel!.characters,
                      onloadmore: () => viewModel.getCharactersMore(),
                      loadMore: viewModel.loadMore,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchinputwidget(BuildContext context,
      {required CharactersRequest viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: viewModel.getCharacterNameFilter,
        decoration: InputDecoration(
          hintText: 'Karakterlerde Ara',
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon:
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
