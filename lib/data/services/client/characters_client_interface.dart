import 'package:marveldex/data/model/character.dart';

abstract class CharactersClientInterface {
  Future<List<Character>> getCharacters({required int offset});
  Future<Character?> getCharacterById(int id);
}
