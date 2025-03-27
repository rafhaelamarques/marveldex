import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marveldex/data/model/comic.dart';
import 'package:marveldex/data/model/thumbnail.dart';
import 'package:marveldex/data/model/url.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@Freezed()
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String description,
    required Thumbnail thumbnail,
    required Comic comics,
    required Comic series,
    required Comic stories,
    required Comic events,
    required List<Url> urls,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
