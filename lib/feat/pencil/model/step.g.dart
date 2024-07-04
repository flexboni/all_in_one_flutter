// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepImpl _$$StepImplFromJson(Map<String, dynamic> json) => _$StepImpl(
      code: json['code'] as String?,
      title: json['title'] as String?,
      step: (json['step'] as num?)?.toInt(),
      urlLottie: json['url_lottie'] as String?,
      urlMp3: json['url_mp3'] as String?,
      recommends: (json['recommends'] as List<dynamic>?)
          ?.map((e) => Recommend.fromJson(e as Map<String, dynamic>))
          .toList(),
      contentStepview: json['content_stepview'] as String?,
    );

Map<String, dynamic> _$$StepImplToJson(_$StepImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'step': instance.step,
      'url_lottie': instance.urlLottie,
      'url_mp3': instance.urlMp3,
      'recommends': instance.recommends,
      'content_stepview': instance.contentStepview,
    };
