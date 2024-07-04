// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendImpl _$$RecommendImplFromJson(Map<String, dynamic> json) =>
    _$RecommendImpl(
      code: json['code'] as String?,
      typeRecommend: json['type_recommend'] as String?,
      timeRecommend: (json['time_recommend'] as num?)?.toInt(),
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => Lecture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecommendImplToJson(_$RecommendImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type_recommend': instance.typeRecommend,
      'time_recommend': instance.timeRecommend,
      'lectures': instance.lectures,
    };
