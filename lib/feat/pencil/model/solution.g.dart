// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolutionImpl _$$SolutionImplFromJson(Map<String, dynamic> json) =>
    _$SolutionImpl(
      comment: json['comment'] as String?,
      questionCode: json['question_code'] as String?,
      code: json['code'] as String?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => SolutionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SolutionImplToJson(_$SolutionImpl instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'question_code': instance.questionCode,
      'code': instance.code,
      'lectures': instance.lectures,
      'steps': instance.steps,
    };
