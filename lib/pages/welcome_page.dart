import 'package:flutter/material.dart';

import 'package:quiz/modules.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  QuizCategory? _category;
  QuizDifficulty? _difficulty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text('Welcome to quiz!'),
          Container(height: 30),
          const Text('Choose category of questions.'),
          DropdownButton(
            value: _category,
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: QuizCategory.linux, child: Text('Linux')),
              DropdownMenuItem(value: QuizCategory.devOps, child: Text('DevOps')),
              // DropdownMenuItem(value: QuizCategory.networking, child: Text('Networking')),
              // DropdownMenuItem(value: QuizCategory.programming, child: Text('Programming')),
              // DropdownMenuItem(value: QuizCategory.cloud, child: Text('Cloud')),
              DropdownMenuItem(value: QuizCategory.docker, child: Text('Docker')),
              // DropdownMenuItem(value: QuizCategory.kubernetes, child: Text('Kubernetes')),
            ],
            onChanged: (value) {
              setState(() {
                _category = value;
              });
            },
          ),
          const Text('Choose difficulty of questions.'),
          DropdownButton(
            value: _difficulty,
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: QuizDifficulty.easy, child: Text('Easy')),
              DropdownMenuItem(value: QuizDifficulty.medium, child: Text('Medium')),
              DropdownMenuItem(value: QuizDifficulty.hard, child: Text('Hard')),
            ],
            onChanged: (value) {
              setState(() {
                _difficulty = value;
              });
            },
          ),
          // ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/question', arguments: {'category': _category, 'difficulty': _difficulty}), child: const Text('Start')),
          ElevatedButton(
              onPressed: () async {
                List<QuizQuestion> questions = await QuizQuestion.getQuestions(_category, _difficulty);
                Navigator.pushNamed(context, '/question', arguments: {'questions': questions, 'category': _category, 'difficulty': _difficulty});
              },
              child: const Text('Start')),
          // ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/question'), child: const Text('Start')),
        ],
      ),
    );
  }
}
