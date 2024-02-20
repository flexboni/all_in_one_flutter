// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurriculumImpl _$$CurriculumImplFromJson(Map<String, dynamic> json) =>
    _$CurriculumImpl(
      code: json['code'] as String,
      type: $enumDecode(_$CurriculumTypeEnumMap, json['type']),
      grade: json['grade'] as String?,
      title: json['title'] as String,
      count: json['count'] as int,
      day: json['day'] as int?,
    );

Map<String, dynamic> _$$CurriculumImplToJson(_$CurriculumImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': _$CurriculumTypeEnumMap[instance.type]!,
      'grade': instance.grade,
      'title': instance.title,
      'count': instance.count,
      'day': instance.day,
    };

const _$CurriculumTypeEnumMap = {
  CurriculumType.none: 'none',
  CurriculumType.lecture: 'lecture',
  CurriculumType.problem: 'problem',
};
