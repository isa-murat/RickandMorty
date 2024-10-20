import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rickandmorty/models/characters_model.dart';

class ApiServices {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<CharactersModel> getCharacters({String? url, Map
  <String, dynamic>? args}) async { 
    try{
      final response = await _dio.get(url ?? '/character', queryParameters: args);
      return CharactersModel.fromJson(response.data);

    } on DioException catch(e){
      log('Error $e');
      rethrow;
    } catch(e){
      rethrow;
    }
  }
}

