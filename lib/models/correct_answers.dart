
import 'package:json_annotation/json_annotation.dart';

part 'correct_answers.g.dart';

@JsonSerializable()
class CorrectAnswers {

  CorrectAnswers(this.answer_a_correct, this.answer_b_correct, this.answer_c_correct, this.answer_d_correct, this.answer_e_correct, this.answer_f_correct);

  final String answer_a_correct;
  final String answer_b_correct;
  final String answer_c_correct;
  final String answer_d_correct;
  final String answer_e_correct;
  final String answer_f_correct;

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => _$CorrectAnswersFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectAnswersToJson(this);
}