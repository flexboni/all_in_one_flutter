// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolutionStepImpl _$$SolutionStepImplFromJson(Map<String, dynamic> json) =>
    _$SolutionStepImpl(
      code: json['code'] as String?,
      step: json['step'] as int?,
      comment: json['comment'] as String?,
      contentSolution: json['content_solution'] as String?,
      editorSolution: json['editor_solution'] as String?,
      latexSolution: json['latex_solution'] as String?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SolutionStepImplToJson(_$SolutionStepImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'step': instance.step,
      'comment': instance.comment,
      'content_solution': instance.contentSolution,
      'editor_solution': instance.editorSolution,
      'latex_solution': instance.latexSolution,
      'lectures': instance.lectures,
    };
