import 'dart:convert';

import 'models.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'quiz_question.g.dart';

enum QuizCategory { linux, devOps, networking, programming, cloud, docker, kubernetes }

enum QuizDifficulty { easy, medium, hard }

@JsonSerializable()
class QuizQuestion {
  QuizQuestion(this.id, this.question, this.description, this.answers, this.correctAnswers, this.category, this.difficulty);

  final int? id;
  final String? question;
  final String? description;
  final Answers answers;
  final CorrectAnswers correctAnswers;
  final String category;
  final String difficulty;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuizQuestionToJson(this);

  static Future<List<QuizQuestion>> getQuestions(QuizCategory? category, QuizDifficulty? difficulty) async {
    http.Client httpClient = http.Client();

    Map<String, dynamic> query = {'apiKey': '06HopUWVIBKhCzxpktOVWYQ2uMGtx2MU5meN587M', 'limit': '5'};

    if (category != null) {
      query.addAll({'category': category.name});
    }

    if (difficulty != null) {
      query.addAll({'difficulty': difficulty.name});
    }

    var uri = Uri.https('quizapi.io', '/api/v1/questions', query);

    try {
      var response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        return [];
      }
      var bodyJson = jsonDecode(response.body);
      var data = bodyJson.map<QuizQuestion>((json) => QuizQuestion.fromJson(json)).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
