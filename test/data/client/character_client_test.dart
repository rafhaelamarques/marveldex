import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marveldex/data/model/character.dart';
import 'package:marveldex/data/services/client/characters_client.dart';
import 'package:marveldex/data/services/dio/dio_manager.dart';
import 'package:mocktail/mocktail.dart';

class MockDioManager extends Mock implements DioManager {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockDioManager mockDio;
  late CharactersClient client;

  setUp(() {
    mockDio = MockDioManager();
    client = CharactersClient(dio: mockDio);
  });

  group('getCharacters', () {
    test('Deve fazer uma requisição', () async {
      final mockResponse = MockResponse();
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn('{"data": {"results": []}}');
      when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

      try {
        await client.getCharacters();
      } catch (_) {}

      verify(() => mockDio.get('/characters?offset=0&limit=20')).called(1);
    });

    test(
      'Deve retornar CharacterRequestFailure para status diferente de 200',
      () {
        final mockResponse = MockResponse();
        when(() => mockResponse.statusCode).thenReturn(400);
        when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

        expect(
          () async => client.getCharacters(),
          throwsA(isA<CharacterRequestFailure>()),
        );
      },
    );

    test('Deve retornar CharacterNotFoundFailure para lista vazia', () {
      final mockResponse = MockResponse();
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn({});
      when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

      expect(
        () async => client.getCharacters(),
        throwsA(isA<CharacterNotFoundFailure>()),
      );
    });

    test(
      'Deve retornar uma lista de characters ou um response válido',
      () async {
        final mockResponse = MockResponse();
        when(() => mockResponse.statusCode).thenReturn(200);
        when(() => mockResponse.data).thenReturn({
          'data': {
            'results': [
              {
                "id": 1011334,
                "name": "3-D Man",
                "description": "",
                "thumbnail": {"path": "", "extension": ""},
                "comics": {"available": 2, "items": []},
                "series": {"available": 3, "items": []},
                "stories": {"available": 2, "items": []},
                "events": {"available": 1, "items": []},
                "urls": [],
              },
              {
                "id": 1012717,
                "name": "Agatha Harkness",
                "description": "",
                "thumbnail": {"path": "", "extension": "jpg"},
                "comics": {"available": 19, "items": []},
                "series": {"available": 9, "items": [], "returned": 9},
                "stories": {"available": 23, "items": []},
                "events": {"available": 0, "items": []},
                "urls": [],
              },
            ],
          },
        });
        when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

        expect(await client.getCharacters(), isA<List<Character>>());
      },
    );
  });
}
