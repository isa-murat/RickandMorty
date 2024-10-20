import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locater.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/api_services.dart';

class CharactersRequest extends ChangeNotifier {
  final _apiService = locator<ApiServices>();

  CharactersModel? _charactersModel;
  CharactersModel? get charactersModel => _charactersModel;

  void clearCharacters() {
    _charactersModel = null;
    pageIndex = 0;
    notifyListeners();
  }

  void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners();
  }

  bool loadMore = false;
  int pageIndex = 1;

  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  void getCharactersMore() async {
    if (loadMore) return;

    if (_charactersModel!.info.pages == pageIndex) return;

    setLoadMore(true);
    final data = await _apiService.getCharacters(url: _charactersModel?.info.next);
    setLoadMore(false);
    pageIndex++;
    _charactersModel!.info = data.info;
    _charactersModel!.characters.addAll(data.characters);
    notifyListeners();
  }

  void getCharacterNameFilter(String name) async {
    clearCharacters();
    _charactersModel = await _apiService.getCharacters(args: {'name': name});
    notifyListeners();
  }
}
