import 'package:flutter_test/flutter_test.dart';
import 'package:marveldex/data/model/character.dart';

void main() {
  group('Character', () {
    test('Deve retornar um objeto Character', () {
      expect(
        Character.fromJson(<String, dynamic>{
          "id": 1011334,
          "name": "3-D Man",
          "description":
              "A hero who emerged through the fusion of two unique brothers Hal and Chuck Chandler.",
          "thumbnail": {"path": "", "extension": ""},
          "comics": {"available": 2, "items": []},
          "series": {"available": 3, "items": []},
          "stories": {"available": 2, "items": []},
          "events": {"available": 1, "items": []},
          "urls": [],
        }),
        isA<Character>()
            .having((c) => c.id, 'id', 1011334)
            .having((c) => c.name, 'name', '3-D Man')
            .having(
              (c) => c.description,
              'description',
              'A hero who emerged through the fusion of two unique brothers Hal and Chuck Chandler.',
            ),
      );
    });
  });
}
