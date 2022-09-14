import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiz/modules.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final List<QuizQuestion> questions = arguments['questions'];
    final List<Map<String, bool>> answers = arguments['answers'];
    final DateTime startTime = arguments['startTime'];
    final Duration duration = startTime.difference(DateTime.now());

    QuizCategory? category = arguments['category'];
    QuizDifficulty? difficulty = arguments['difficulty'];

    int rightAnswers = 0;
    int wrongAnswers = 0;

    for (int i = 0; i < questions.length; i++) {
      if (questions[i].correctAnswers.answer_a_correct == (answers[i]['a'] ?? false).toString() &&
          questions[i].correctAnswers.answer_b_correct == (answers[i]['b'] ?? false).toString() &&
          questions[i].correctAnswers.answer_c_correct == (answers[i]['c'] ?? false).toString() &&
          questions[i].correctAnswers.answer_d_correct == (answers[i]['d'] ?? false).toString() &&
          questions[i].correctAnswers.answer_e_correct == (answers[i]['e'] ?? false).toString() &&
          questions[i].correctAnswers.answer_f_correct == (answers[i]['f'] ?? false).toString()) {
        rightAnswers++;
      } else {
        wrongAnswers++;
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Test result:'),
            Text('Start time:  ${startTime}'),
            // Text('Test execution time: ${duration}'),
            Text('Category: ${category?.name ?? ''}'),
            Text('Difficulty: ${difficulty?.name ?? ''}'),
            Text('Amount of right answers: ${rightAnswers}'),
            Text('Amount of wrong answers: ${wrongAnswers}'),
            ElevatedButton(
              onPressed: () {
                DatabaseReference _testRef = FirebaseDatabase.instance.ref('test');
                _testRef.set('Start time:  ${startTime}\nCategory: ${category?.name ?? ''}\nDifficulty: ${difficulty?.name ?? ''}\nAmount of right answers: ${rightAnswers}\nAmount of wrong answers: ${wrongAnswers}');
              },
              child: Text('Add result to database.'),
            )
          ],
        ),
      ),
    );
  }
}
