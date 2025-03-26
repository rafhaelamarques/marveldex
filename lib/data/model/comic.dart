import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'comic.g.dart';

@JsonSerializable()
class Comic {
  int available;
  List<Item> items;

  Comic({required this.available, required this.items});

  factory Comic.fromJson(Map<String, dynamic> json) => _$ComicFromJson(json);

  Map<String, dynamic> toJson() => _$ComicToJson(this);
}
