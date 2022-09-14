// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answers _$AnswersFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Answers',
      json,
      ($checkedConvert) {
        final val = Answers(
          $checkedConvert('answer_a', (v) => v as String?),
          $checkedConvert('answer_b', (v) => v as String?),
          $checkedConvert('answer_c', (v) => v as String?),
          $checkedConvert('answer_d', (v) => v as String?),
          $checkedConvert('answer_e', (v) => v as String?),
          $checkedConvert('answer_f', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{
      'answer_a': instance.answer_a,
      'answer_b': instance.answer_b,
      'answer_c': instance.answer_c,
      'answer_d': instance.answer_d,
      'answer_e': instance.answer_e,
      'answer_f': instance.answer_f,
    };
