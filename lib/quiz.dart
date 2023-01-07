import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final Function questionAnswered;
  final List questions;
  final int questionIndex;
  final int totalScore;

  const Quiz(this.questionAnswered, this.questions, this.questionIndex,
      this.totalScore,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Questions(
        questions[questionIndex]['questionsText'] as String,
      ),
      ...(questions[questionIndex]['answeredQuestion']
              as List<Map<String, Object>>)
          .map(
        (answers) {
          return Answers(() => questionAnswered(answers['score']),
              answers['text'] as String, questionIndex, totalScore);
        },
      )
    ]);
  }
}
