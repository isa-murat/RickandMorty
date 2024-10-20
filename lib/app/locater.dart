import 'package:get_it/get_it.dart';
import 'package:rickandmorty/services/api_services.dart';
import 'package:rickandmorty/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void>setupLocater() async {
  final  prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<ApiServices>(()=> ApiServices());
  locator.registerLazySingleton<PreferencesService>(()=> PreferencesService(prefs:prefs));
}