import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Yellow', 'score': 30},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 20}
      ],
    },
    {
      'questionText': 'What\'s your favorite drink?',
      'answers': [
        {'text': 'Tea', 'score': 10},
        {'text': 'Water', 'score': 15},
        {'text': 'Soda', 'score': 20},
        {'text': 'Juice', 'score': 25}
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Pilau', 'score': 10},
        {'text': 'Ugali', 'score': 15},
        {'text': 'French Fries', 'score': 20},
        {'text': 'Hamburger', 'score': 30}
      ],
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    _totalScore = 0;
    });
    
  }

  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('More questions present');
    } else {
      print('Np more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Tutorial App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(_questions, _answerQuestions, _questionIndex)
                : Result(_totalScore, _resetQuiz)));
  }
}
