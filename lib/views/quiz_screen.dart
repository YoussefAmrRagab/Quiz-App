import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/views/start_screen.dart';
import 'package:quiz_app/views/widgets/background_style.dart';
import 'package:quiz_app/views/widgets/question_summary_widget.dart';
import 'package:quiz_app/views/widgets/text_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final questionsData = questions;
  int index = 0;

  List<String> userAnswers = [];
  int score = 0;

  List<Map<String, dynamic>> get summaryStatistics {
    List<Map<String, dynamic>> summaryStatistics = [];
    for (int i = 0; i < questions.length; i++) {
      summaryStatistics.add({
        "question_index": i,
        "question": questionsData[i].question,
        "question_answer": questionsData[i].answerList[0],
        "user_answer": userAnswers[i]
      });
    }
    return summaryStatistics;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundStyle(
      child: index < questionsData.length
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => setState(() {
                          if (index == 0) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StartScreen()));
                          } else {
                            index--;
                            userAnswers.removeAt(index);
                          }
                        }),
                      ),
                      Text(
                        "Question ${index + 1}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        onPressed: () => setState(() {
                          index++;
                          userAnswers.add('');
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextWidget(questionsData[index].question, fontStyleNumber: 1),
                  const SizedBox(height: 14),
                  ...questionsData[index].shuffledAnswer.map(
                        (item) => FilledButton(
                          onPressed: () => setState(() {
                            userAnswers.add(item);
                            if (item == questionsData[index].answerList[0]) {
                              score++;
                            }
                            index++;
                          }),
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 20, vertical: 8),
                            backgroundColor:
                                const Color.fromARGB(255, 33, 1, 95),
                          ),
                          child: Text(item),
                        ),
                      ),
                ],
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  TextWidget(
                      "You answered $score out of ${questionsData.length} questions correctly!",
                      fontStyleNumber: 0),
                  const SizedBox(
                    height: 14,
                  ),
                  QuestionSummaryWidget(summaryStatistics),
                  const SizedBox(
                    height: 14,
                  ),
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white),
                      onPressed: () {
                        setState(() {
                          index = 0;
                          score = 0;
                          userAnswers.clear();
                        });
                      },
                      icon: const Icon(Icons.restart_alt),
                      label: const Text(
                        "Restart Quiz",
                      ))
                ]),
    ));
  }
}
