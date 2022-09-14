// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'QuizQuestion',
      json,
      ($checkedConvert) {
        final val = QuizQuestion(
          $checkedConvert('id', (v) => v as int?),
          $checkedConvert('question', (v) => v as String?),
          $checkedConvert('description', (v) => v as String?),
          $checkedConvert(
              'answers', (v) => Answers.fromJson(v as Map<String, dynamic>)),
          $checkedConvert('correct_answers',
              (v) => CorrectAnswers.fromJson(v as Map<String, dynamic>)),
          $checkedConvert('category', (v) => v as String),
          $checkedConvert('difficulty', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'correctAnswers': 'correct_answers'},
    );

Map<String, dynamic> _$QuizQuestionToJson(QuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'description': instance.description,
      'answers': instance.answers,
      'correct_answers': instance.correctAnswers,
      'category': instance.category,
      'difficulty': instance.difficulty,
    };
