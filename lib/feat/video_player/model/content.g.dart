// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      title: json['title'] as String,
      structure: json['structure'] as String,
      type: $enumDecode(_$ContentTypeEnumMap, json['type']),
      lectureType: json['lecture_type'] as String,
      urlVideo: json['url_video'] as String,
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'structure': instance.structure,
      'type': _$ContentTypeEnumMap[instance.type]!,
      'lecture_type': instance.lectureType,
      'url_video': instance.urlVideo,
    };

const _$ContentTypeEnumMap = {
  ContentType.none: 'none',
  ContentType.lecture: 'lecture',
  ContentType.explanation: 'explanation',
};
