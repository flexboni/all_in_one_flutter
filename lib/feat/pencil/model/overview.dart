import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/recommend.dart';
import 'package:all_in_one_flutter/feat/pencil/model/step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview.freezed.dart';
part 'overview.g.dart';

@freezed
class Overview with _$Overview {
  const factory Overview({
    String? code,
    @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW) String? urlPreview,
    List<Step>? steps,
    Recommend? recommend,
  }) = _Overview;

  factory Overview.fromJson(Map<String, dynamic> json) =>
      _$OverviewFromJson(json);
}
