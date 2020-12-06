import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:question_project/widgets/quiz.dart';
import 'package:question_project/widgets/result.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  runApp(QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  int _selectedQuestion = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual é a sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'pontuation': 10},
        {'text': 'Vermelho', 'pontuation': 5},
        {'text': 'Verde', 'pontuation': 3},
        {'text': 'Branco', 'pontuation': 1},
      ]
    },
    {
      'text': 'Qual é o seu animal favorito?',
      'answers': [
        {'text': 'Coelho', 'pontuation': 10},
        {'text': 'Elefante', 'pontuation': 5},
        {'text': 'Leão', 'pontuation': 3},
        {'text': 'Tigre', 'pontuation': 1},
      ]
    },
    {
      'text': 'Qual o seu instrutor favorito?',
      'answers': [
        {'text': 'Michelon', 'pontuation': 10},
        {'text': 'Lilian', 'pontuation': 5},
        {'text': 'Júlia', 'pontuation': 3},
        {'text': 'Arquimedes', 'pontuation': 1},
      ]
    },
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _answer(int pontuation) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion = _selectedQuestion + 1;
        _score += pontuation;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: hasSelectedQuestion
              ? Quiz(
                  onAnswer: _answer,
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                )
              : Result(
                  score: _score,
                  onRestart: _restartQuiz,
                ),
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  @override
  State<QuestionApp> createState() {
    return _QuestionAppState();
  }
}
