// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correct_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorrectAnswers _$CorrectAnswersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CorrectAnswers',
      json,
      ($checkedConvert) {
        final val = CorrectAnswers(
          $checkedConvert('answer_a_correct', (v) => v as String),
          $checkedConvert('answer_b_correct', (v) => v as String),
          $checkedConvert('answer_c_correct', (v) => v as String),
          $checkedConvert('answer_d_correct', (v) => v as String),
          $checkedConvert('answer_e_correct', (v) => v as String),
          $checkedConvert('answer_f_correct', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CorrectAnswersToJson(CorrectAnswers instance) =>
    <String, dynamic>{
      'answer_a_correct': instance.answer_a_correct,
      'answer_b_correct': instance.answer_b_correct,
      'answer_c_correct': instance.answer_c_correct,
      'answer_d_correct': instance.answer_d_correct,
      'answer_e_correct': instance.answer_e_correct,
      'answer_f_correct': instance.answer_f_correct,
    };
