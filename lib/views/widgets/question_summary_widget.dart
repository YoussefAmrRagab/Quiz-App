import 'package:flutter/material.dart';
import 'package:quiz_app/views/widgets/text_widget.dart';

class QuestionSummaryWidget extends StatelessWidget {
  QuestionSummaryWidget(this.summaryStatistics, {Key? key}) : super(key: key);
  List<Map<String, dynamic>> summaryStatistics;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 320,
      child: SingleChildScrollView(
        child: Column(
            children: summaryStatistics
                .map((item) => Row(children: [
                      CircleAvatar(
                        backgroundColor:
                            item["question_answer"] == item["user_answer"]
                                ? Colors.lightBlueAccent
                                : Colors.purpleAccent,
                        foregroundColor: Colors.black,
                        child: Text((item["question_index"] + 1).toString()),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextWidget(item["question"], fontStyleNumber: 2),
                              Text(item["question_answer"],
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 219, 197, 255))),
                              Text(
                                item["user_answer"],
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 163, 213, 253)),
                              )
                            ],
                          ),
                        ),
                      )
                    ]))
                .toList()),
      ),
    );
  }
}
