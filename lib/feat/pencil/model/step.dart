import 'package:all_in_one_flutter/constant/keys.dart';
import 'package:all_in_one_flutter/feat/pencil/model/recommend.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'step.freezed.dart';
part 'step.g.dart';

@freezed
class Step with _$Step {
  const factory Step({
    String? code,
    String? title,
    int? step,
    @JsonKey(name: Keys.STEPS_URL_LOTTIE) String? urlLottie,
    @JsonKey(name: Keys.STEPS_URL_MP3) String? urlMp3,
    List<Recommend>? recommends,
    @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW) String? contentStepview,
  }) = _Step;

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}
