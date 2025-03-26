import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/data/services/dio/dio_creator.dart';
import 'package:retrofit/retrofit.dart';

part 'characters_client.g.dart';

@RestApi()
abstract class CharactersClient {
  factory CharactersClient() {
    var dio = DioCreator.instance.generateMarvelUrl();

    return _CharactersClient(dio);
  }

  @GET('/characters')
  Future<List<Character>> getCharacters({
    @Query('limit') int limit = 20,
    @Query('offset') int offset = 0,
    @Query('nameStartsWith') String? nameStartsWith,
  });

  @GET('/characters/{characterId}')
  Future<Character> getCharacterById({
    @Path('characterId') required int characterId,
  });
}
