import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/data/services/client/characters_client_interface.dart';
import 'package:marveldex/data/services/dio/dio_manager.dart';

class CharactersClient implements CharactersClientInterface {
  final DioManager dio;
  CharactersClient({required this.dio});

  @override
  Future<List<Character>> getCharacters({int offset = 0}) async {
    final response = await dio.get(
      '/characters'
      '?offset=$offset',
    );

    final data = response.data['data']['results'] as List;
    return data.map((e) => Character.fromJson(e)).toList();
  }

  @override
  Future<Character?> getCharacterById(int characterId) async {
    final response = await dio.get('/characters/$characterId');
    final data = response.data['data']['results'] as List;

    if (data.isEmpty) {
      return null;
    }

    return Character.fromJson(data.first);
  }
}
