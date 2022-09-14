import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:quiz/modules.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentQuestion = 0;
  List<Map<String, bool>> answers = [];
  DateTime startTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    final List<QuizQuestion> questions = arguments['questions'];
    for (int i = answers.length; i < questions.length; i++) {
      answers.add({});
    }

    QuizCategory? category = arguments['category'];
    QuizDifficulty? difficulty = arguments['difficulty'];

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${currentQuestion + 1} / ${questions.length}'),
          Container(height: 30),
          Flexible(child: Text(questions[currentQuestion].question ?? '')),
          if (questions[currentQuestion].answers.answer_a != null) ...[
            Row(
              children: [
                Checkbox(
                    value: answers[currentQuestion]['a'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        answers[currentQuestion]['a'] = value!;
                      });
                    }),
                Flexible(child: Text(questions[currentQuestion].answers.answer_a ?? '')),
              ],
            ),
          ],
          if (questions[currentQuestion].answers.answer_b != null) ...[
            Row(
              children: [
                Checkbox(
                    value: answers[currentQuestion]['b'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        answers[currentQuestion]['b'] = value!;
                      });
                    }),
                Flexible(child: Text(questions[currentQuestion].answers.answer_b ?? '')),
              ],
            ),
          ],
          if (questions[currentQuestion].answers.answer_c != null) ...[
            Row(
              children: [
                Checkbox(
                    value: answers[currentQuestion]['c'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        answers[currentQuestion]['c'] = value!;
                      });
                    }),
                Flexible(child: Text(questions[currentQuestion].answers.answer_c ?? '')),
              ],
            ),
          ],
          if (questions[currentQuestion].answers.answer_d != null) ...[
            Row(
              children: [
                Checkbox(
                    value: answers[currentQuestion]['d'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        answers[currentQuestion]['d'] = value!;
                      });
                    }),
                Flexible(child: Text(questions[currentQuestion].answers.answer_d ?? '')),
              ],
            ),
          ],
          if (questions[currentQuestion].answers.answer_e != null) ...[
            Row(
              children: [
                Checkbox(
                    value: answers[currentQuestion]['e'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        answers[currentQuestion]['e'] = value!;
                      });
                    }),
                Flexible(child: Text(questions[currentQuestion].answers.answer_e ?? '')),
              ],
            ),
          ],
          if (questions[currentQuestion].answers.answer_f != null) ...[
            Row(
              children: [
                Checkbox(
                    value: answers[currentQuestion]['f'] ?? false,
                    onChanged: (value) {
                      setState(() {
                        answers[currentQuestion]['f'] = value!;
                      });
                    }),
                Flexible(child: Text(questions[currentQuestion].answers.answer_f ?? '')),
              ],
            ),
          ],
          ElevatedButton(
            onPressed: () {
              if ((currentQuestion + 1) < questions.length) {
                setState(() {
                  currentQuestion++;
                });
              } else {
                Navigator.pushNamed(context, '/result',
                    arguments: {'questions': questions, 'answers': answers, 'startTime': startTime, 'category': category, 'difficulty': difficulty});
              }
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
