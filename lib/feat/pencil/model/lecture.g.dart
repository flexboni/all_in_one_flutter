// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LectureImpl _$$LectureImplFromJson(Map<String, dynamic> json) =>
    _$LectureImpl(
      title: json['title'] as String,
      code: json['code'] as String,
      type: json['type'] as String?,
      titleNav: json['title_nav'] as String?,
      isActive: json['is_active'] as bool?,
      urlThumbnail: json['url_thumbnail'] as String?,
      typeLecture: json['type_lecture'] as String?,
      urlVideo: json['url_video'] as String?,
      urlVideo1: json['url_video1'] as String?,
      urlVideo2: json['url_video2'] as String?,
      questions: json['questions'] as String?,
      questionsInfo: (json['questions_info'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$LectureImplToJson(_$LectureImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'type': instance.type,
      'title_nav': instance.titleNav,
      'is_active': instance.isActive,
      'url_thumbnail': instance.urlThumbnail,
      'type_lecture': instance.typeLecture,
      'url_video': instance.urlVideo,
      'url_video1': instance.urlVideo1,
      'url_video2': instance.urlVideo2,
      'questions': instance.questions,
      'questions_info': instance.questionsInfo,
      'created_at': instance.createdAt,
    };
