// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverviewImpl _$$OverviewImplFromJson(Map<String, dynamic> json) =>
    _$OverviewImpl(
      code: json['code'] as String?,
      urlPreview: json['url_preview'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommend: json['recommend'] == null
          ? null
          : Recommend.fromJson(json['recommend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OverviewImplToJson(_$OverviewImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'url_preview': instance.urlPreview,
      'steps': instance.steps,
      'recommend': instance.recommend,
    };
