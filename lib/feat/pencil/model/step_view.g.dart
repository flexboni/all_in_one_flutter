// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepViewImpl _$$StepViewImplFromJson(Map<String, dynamic> json) =>
    _$StepViewImpl(
      code: json['code'] as String?,
      step: json['step'] as int?,
      title: json['title'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      unionRecommends: (json['union_recommends'] as List<dynamic>?)
          ?.map((e) => Recommend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StepViewImplToJson(_$StepViewImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'step': instance.step,
      'title': instance.title,
      'steps': instance.steps,
      'union_recommends': instance.unionRecommends,
    };
