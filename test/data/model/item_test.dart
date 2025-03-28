import 'package:flutter_test/flutter_test.dart';
import 'package:marveldex/data/model/item.dart';

void main() {
  group('Item', () {
    test('Deve retornar um objeto Item', () {
      expect(
        Item.fromJson(<String, dynamic>{
          "name": "Marvel Premiere (1972) #36",
          "type": "cover",
        }),
        isA<Item>()
            .having((i) => i.name, 'name', 'Marvel Premiere (1972) #36')
            .having((i) => i.type, 'type', 'cover'),
      );
    });
  });
}
