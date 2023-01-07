import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback quizResting;

  const Result(this.totalScore, this.quizResting, {super.key});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(80),
        child: Column(children: [
          Text("Total : $totalScore / 12",
              style: const TextStyle(
                fontSize: 32,
                color: Colors.red,
              )),
          TextButton(
              onPressed: quizResting,
              child: const Text('Resting Quiz',
                  style: TextStyle(fontSize: 18, color: Colors.blueAccent)))
        ]),
      ),
    );
  }
}
