// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      answerNo: (json['answer_no'] as num?)?.toInt(),
      contentAnswer: json['content_answer'] as String?,
      editorAnswer: json['editor_answer'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      isCorrect: $enumDecodeNullable(_$CorrectEnumMap, json['is_correct']),
      code: json['code'] as String?,
      questionCode: json['question_code'] as String?,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'answer_no': instance.answerNo,
      'content_answer': instance.contentAnswer,
      'editor_answer': instance.editorAnswer,
      'correct_answer': instance.correctAnswer,
      'is_correct': _$CorrectEnumMap[instance.isCorrect],
      'code': instance.code,
      'question_code': instance.questionCode,
    };

const _$CorrectEnumMap = {
  Correct.T: 'T',
  Correct.F: 'F',
};
