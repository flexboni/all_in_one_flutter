import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/lecture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend.freezed.dart';
part 'recommend.g.dart';

@freezed
class Recommend with _$Recommend {
  const factory Recommend({
    String? code,
    @JsonKey(name: Keys.RECOMMENDS_TYPE_RECOMMEND) String? typeRecommend,
    @JsonKey(name: Keys.RECOMMENDS_TIME_RECOMMEND) int? timeRecommend,
    List<Lecture>? lectures,
  }) = _Recommend;

  factory Recommend.fromJson(Map<String, dynamic> json) =>
      _$RecommendFromJson(json);
}
