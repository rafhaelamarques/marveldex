import 'package:freezed_annotation/freezed_annotation.dart';

import 'item.dart';

part 'comic.freezed.dart';
part 'comic.g.dart';

@Freezed()
abstract class Comic with _$Comic {
  const factory Comic({required int available, required List<Item> items}) =
      _Comic;

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);
}
