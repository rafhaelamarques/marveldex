import 'package:json_annotation/json_annotation.dart';
import 'package:marveldex/data/model/comic.dart';
import 'package:marveldex/data/model/thumbnail.dart';
import 'package:marveldex/data/model/url.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  int id;
  String name;
  String description;
  Thumbnail thumbnail;
  Comic comics;
  Comic series;
  Comic stories;
  Comic events;
  List<Url> urls;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
