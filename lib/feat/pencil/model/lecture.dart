import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lecture.freezed.dart';
part 'lecture.g.dart';

@freezed
class Lecture with _$Lecture {
  const factory Lecture({
    required String title,
    required String code,
    String? type,
    @JsonKey(name: Keys.LECTURE_TITLE_NAV) String? titleNav,
    @JsonKey(name: Keys.LECTURE_IS_ACTIVE) bool? isActive,
    @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL) String? urlThumbnail,
    @JsonKey(name: Keys.LECTURES_TYPE_LECTURE) String? typeLecture,
    @JsonKey(name: Keys.URL_VIDEO) String? urlVideo,
    @JsonKey(name: Keys.LECTURES_URL_VIDEO_1) String? urlVideo1,
    @JsonKey(name: Keys.LECTURES_URL_VIDEO_2) String? urlVideo2,
    String? questions,
    @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO) List<Question>? questionsInfo,
    @JsonKey(name: Keys.LECTURE_CREATED_AT) String? createdAt,
  }) = _Lecture;

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);
}
