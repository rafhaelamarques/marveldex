import 'package:flutter_test/flutter_test.dart';
import 'package:marveldex/data/model/thumbnail.dart';

void main() {
  group('Thumbnail', () {
    test('Deve retornar um objeto Thumbnail', () {
      expect(
        Thumbnail.fromJson(<String, dynamic>{
          "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
          "extension": "jpg",
        }),
        isA<Thumbnail>()
            .having(
              (t) => t.path,
              'path',
              'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784',
            )
            .having((t) => t.extension, 'extension', 'jpg'),
      );
    });
  });
}
