import 'package:flutter_test/flutter_test.dart';
import 'package:marveldex/data/model/url.dart';

void main() {
  group('Url', () {
    test('Deve retornar um objeto Url', () {
      expect(
        Url.fromJson(<String, dynamic>{
          "type": "detail",
          "url": "http://marvel.com/comics/characters/1011334/3-d_man",
        }),
        isA<Url>()
            .having((u) => u.type, 'type', 'detail')
            .having(
              (u) => u.url,
              'url',
              'http://marvel.com/comics/characters/1011334/3-d_man',
            ),
      );
    });
  });
}
