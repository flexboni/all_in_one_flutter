// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      code: json['code'] as String?,
      title: json['title'] as String?,
      typeQuestion: json['type_question'] as String?,
      contentQuestion: json['content_question'] as String?,
      urlThumbnail: json['url_thumbnail'] as String?,
      solveTime: json['solve_time'] as int?,
      incorrectRate: json['incorrect_rate'] as int?,
      answersCorrects: (json['answers_correct'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] == null
          ? null
          : Overview.fromJson(json['overview'] as Map<String, dynamic>),
      stepviews: (json['stepviews'] as List<dynamic>?)
          ?.map((e) => StepView.fromJson(e as Map<String, dynamic>))
          .toList(),
      solutions: (json['solutions'] as List<dynamic>?)
          ?.map((e) => Solution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'type_question': instance.typeQuestion,
      'content_question': instance.contentQuestion,
      'url_thumbnail': instance.urlThumbnail,
      'solve_time': instance.solveTime,
      'incorrect_rate': instance.incorrectRate,
      'answers_correct': instance.answersCorrects,
      'answers': instance.answers,
      'overview': instance.overview,
      'stepviews': instance.stepviews,
      'solutions': instance.solutions,
    };
