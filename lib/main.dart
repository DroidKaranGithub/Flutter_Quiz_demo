import 'package:flutter/material.dart';
import 'package:flutter_quiz_demo/quiz.dart';

import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answeQuestion(int score) {
    _totalScore += score;
    print(_totalScore);
    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answer': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': [
          {'text': 'Rabbit', 'score': 1},
          {'text': 'Snake', 'score': 10},
          {'text': 'Tiger', 'score': 5},
          {'text': 'Lion', 'score': 3}
        ]
      },
      {
        'questionText': 'What\'s your favorite car?',
        'answer': [
          {'text': 'TATA', 'score': 1},
          {'text': 'Mahindra', 'score': 3},
          {'text': 'Maruti Suzuki', 'score': 5},
          {'text': 'Honda', 'score': 10}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
          ),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                selectHandler: _answeQuestion,
                questionIndex: _questionIndex,
                questions: questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
