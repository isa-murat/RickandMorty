import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService({required this.prefs});

  final String _characterKey = 'character';

  void storeCharacter(List<String> character) async {
    await prefs.setStringList(_characterKey, character);
  }

  void saveCharecter(int id) async {
    final charactersList =  prefs.getStringList(_characterKey) ?? [];
    charactersList.add(id.toString());
    storeCharacter(charactersList);
  }

  void removeCharacter(int id) async {
    final charactersList = prefs.getStringList(_characterKey) ?? [];
    charactersList.remove(id.toString());
    storeCharacter(charactersList);
  }

  List<int> getSavedCharacters() {
    final charactersList = prefs.getStringList(_characterKey) ?? [];
    return charactersList.map((e) => int.parse(e)).toList();
  }
}
