import 'package:flutter/material.dart';
import 'package:quiz_app/views/quiz_screen.dart';
import 'package:quiz_app/views/widgets/background_style.dart';
import 'package:quiz_app/views/widgets/text_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundStyle(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              width: 250,
              color: const Color.fromARGB(153, 255, 255, 255),
            ),
            const SizedBox(height: 50),
            TextWidget("Learn Flutter the fun way!", fontStyleNumber: 1),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const QuizScreen()),
              ),
              style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text(
                "Start Quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
