import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/recommend.dart';
import 'package:all_in_one_flutter/feat/pencil/model/step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_view.freezed.dart';
part 'step_view.g.dart';

@freezed
class StepView with _$StepView {
  const factory StepView({
    String? code,
    int? step,
    String? title,
    List<Step>? steps,
    @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
    List<Recommend>? unionRecommends,
  }) = _StepView;

  factory StepView.fromJson(Map<String, dynamic> json) =>
      _$StepViewFromJson(json);
}
