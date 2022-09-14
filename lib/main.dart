import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:quiz/modules.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  QuizApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fbApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Batabase error.');
        } else if (snapshot.hasData) {
          return MaterialApp(
            title: 'Quiz',
            initialRoute: '/',
            routes: {
              '/': (context) => const WelcomePage(),
              '/question': (context) => QuestionPage(),
              '/result': (context) => const ResultPage(),
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
