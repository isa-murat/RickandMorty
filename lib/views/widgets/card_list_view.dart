import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locater.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/preferences_service.dart';
import 'package:rickandmorty/views/widgets/character_card.dart';

class CardListView extends StatefulWidget {
  final List<CharacterModel> characterModel;
  final VoidCallback onloadmore;
  final bool loadMore;

  const CardListView({
    super.key,
    required this.characterModel,
    required this.onloadmore,
    this.loadMore = false,
  });

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  final _scrollController = ScrollController();
  bool _isLoading = true;
  List<int> _favoritedList = [];

  @override
  void initState() {
    _detectScrollBottom();
    _getFavorites();
    super.initState();
  }

  void _setIsLoading(bool value) {
    _isLoading = value;
    setState(() {});
  }

  void _getFavorites() async {
    _favoritedList = locator<PreferencesService>().getSavedCharacters();
    _setIsLoading(false);
    setState(() {});
  }

  void _detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 200;

      if (maxScroll - currentPosition <= delta) {
        widget.onloadmore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CircularProgressIndicator.adaptive();
    } else {
      return Flexible(
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.characterModel.length,
          itemBuilder: (context, index) {
            final character = widget.characterModel[index];
            final bool isFavorited = _favoritedList.contains(character.id);
            return Column(
              children: [
                CharacterCard(
                    characterModel: character, isFavorited: isFavorited),
                if (widget.loadMore &&
                    index == widget.characterModel.length - 1)
                  const CircularProgressIndicator.adaptive(),
              ],
            );
          },
        ),
      );
    }
  }
}
