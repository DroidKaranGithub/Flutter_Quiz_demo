import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function selectHandler;
  final int questionIndex;
  final List<Map<String, Object>> questions;

  Quiz(
      {required this.selectHandler,
      required this.questionIndex,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['questionText'] as String),
      ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((answer) {
        return Answer(() => selectHandler(answer['score']), answer['text'] as String);
      }).toList()
    ]);
  }
}
