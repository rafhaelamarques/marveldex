import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/data/services/client/characters_client_interface.dart';
import 'package:marveldex/data/services/dio/dio_manager.dart';

class CharacterRequestFailure implements Exception {
  final String message = 'Character request failed';

  @override
  String toString() => message;
}

class CharacterNotFoundFailure implements Exception {
  final String message = 'Character not found';

  @override
  String toString() => message;
}

class CharactersClient implements CharactersClientInterface {
  final DioManager dio;
  CharactersClient({required this.dio});

  @override
  Future<List<Character>> getCharacters({int offset = 0}) async {
    final response = await dio.get(
      '/characters'
      '?offset=$offset&limit=20',
    );

    if (response.statusCode != 200) {
      throw CharacterRequestFailure();
    }

    if (response.data == null ||
        response.data['data'] == null ||
        response.data['data']['results'] == null) {
      throw CharacterNotFoundFailure();
    }

    final data = response.data['data']['results'] as List;
    return data.map((e) => Character.fromJson(e)).toList();
  }

  @override
  Future<Character?> getCharacterById(int characterId) async {
    final response = await dio.get('/characters/$characterId');

    if (response.statusCode != 200) {
      throw CharacterRequestFailure();
    }

    if (response.data == null ||
        response.data['data'] == null ||
        response.data['data']['results'] == null) {
      throw CharacterNotFoundFailure();
    }

    final data = response.data['data']['results'] as List;
    return Character.fromJson(data.first);
  }
}
