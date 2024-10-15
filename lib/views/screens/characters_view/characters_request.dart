import 'package:flutter/material.dart';
import 'package:rickandmorty/app/getit.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/api_services.dart';

class CharactersRequest extends ChangeNotifier {
  final _apiService = locator<ApiServices>();

  CharactersModel? _charactersModel;
  CharactersModel? get charactersModel => _charactersModel;

  void getCharacters() async{
    _charactersModel = await _apiService.getCharacters();
    notifyListeners(); 
  }
}