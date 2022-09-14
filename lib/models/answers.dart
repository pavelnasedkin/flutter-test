
import 'package:json_annotation/json_annotation.dart';

part 'answers.g.dart';

@JsonSerializable()
class Answers {

  Answers(this.answer_a, this.answer_b, this.answer_c, this.answer_d, this.answer_e, this.answer_f);

  final String? answer_a;
  final String? answer_b;
  final String? answer_c;
  final String? answer_d;
  final String? answer_e;
  final String? answer_f;

  factory Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersToJson(this);
}