// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurriculumDataImpl _$$CurriculumDataImplFromJson(Map<String, dynamic> json) =>
    _$CurriculumDataImpl(
      day: json['day'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => Curriculum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurriculumDataImplToJson(
        _$CurriculumDataImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'items': instance.items,
    };
