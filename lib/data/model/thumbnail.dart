import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnail.freezed.dart';
part 'thumbnail.g.dart';

@Freezed()
abstract class Thumbnail with _$Thumbnail {
  const factory Thumbnail({required String path, required String extension}) =
      _Thumbnail;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}
