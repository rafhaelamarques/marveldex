import 'package:freezed_annotation/freezed_annotation.dart';

part 'url.freezed.dart';
part 'url.g.dart';

@Freezed()
abstract class Url with _$Url {
  const factory Url({required String type, required String url}) = _Url;

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
}
