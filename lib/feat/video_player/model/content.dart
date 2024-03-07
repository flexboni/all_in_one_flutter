import 'package:all_in_one_flutter/constant/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

enum ContentType { none, lecture, explanation }

@freezed
class Content with _$Content {
  const factory Content({
    required String title,
    required String structure,
    required ContentType type,
    @JsonKey(name: Keys.LECTURE_TYPE) required String lectureType,
    @JsonKey(name: Keys.URL_VIDEO) required String urlVideo,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  static String lectureTypeToName(String type) =>
      type == Keys.LECTURE_TYPE_CONCEPT ? Strings.CONCEPT : Strings.CATEGORY;
}
