import 'package:flutter_test/flutter_test.dart';
import 'package:marveldex/data/model/comic.dart';

void main() {
  group('Comic', () {
    test('Deve retornar um objeto Comic', () {
      expect(
        Comic.fromJson(<String, dynamic>{
          "available": 2,
          "items": [
            {"name": "Marvel Premiere (1972) #36"},
            {"name": "Marvel Premiere (1972) #37"},
          ],
        }),
        isA<Comic>()
            .having((c) => c.available, 'available', 2)
            .having((c) => c.items.length, 'items.length', 2),
      );
    });
  });
}
