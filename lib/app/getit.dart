import 'package:get_it/get_it.dart';
import 'package:rickandmorty/services/api_services.dart';

final locator = GetIt.instance;

void setupLocater(){
  locator.registerLazySingleton<ApiServices>(()=> ApiServices());
}