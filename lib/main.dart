import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }
}

class _AppState extends State<App> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _quizResting() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _questionAnswered(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    // print(_questionIndex);
  }

  final _questions = [
    {
      'questionsText':
          '1.	Which of the following is a technology that enables users to transmit data from one device to another device without the use of any physical link or cables?',
      'answeredQuestion': [
        {'text': 'A.	Cyber security ', "score": 0},
        {'text': 'B.	Mobile Computing', "score": 1},
        {'text': 'C.	Web Development', "score": 0},
        {'text': 'D. Programming UI', "score": 0}
      ]
    },
    {
      'questionsText':
          '2.	Which of the following isn’t the concept of Mobile computing?',
      'answeredQuestion': [
        {'text': 'A.	Mobile Communication', "score": 0},
        {'text': 'B.	Mobile Hardware', "score": 0},
        {'text': 'C.	Mobile Software', "score": 0},
        {'text': 'D.	Mobile Interface', 'score': 1}
      ]
    },
    {
      'questionsText':
          '3.	Which of the following refers to an infrastructure that ensures seamless and reliable relation among wireless devices?',
      'answeredQuestion': [
        {'text': 'A.	Mobile Communication', 'score': 1},
        {'text': 'B.	Mobile Software', "score": 0},
        {'text': 'C.	Mobile Hardware', "score": 0},
        {'text': 'D.	Mobile Development', "score": 0}
      ]
    },
    {
      'questionsText':
          '4.	In which of the following the devices are fixed at a position, and they are connected through a physical link to communicate with other devices.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wired', "score": 0},
        {'text': 'B.	Fixed and Wired', 'score': 1},
        {'text': 'C.	Fixed and Wireless', "score": 0},
        {'text': 'D.	Mobile and Wireless', "score": 0}
      ]
    },
    {
      'questionsText':
          '5.	In which of the following the devices are fixed at a position, and they are connected through a wireless link to make communication with other devices.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wired', "score": 0},
        {'text': 'B.	Fixed and Wired', "score": 0},
        {'text': 'C.	Fixed and Wireless', 'score': 1},
        {'text': 'D.	Mobile and Wireless', "score": 0}
      ]
    },
    {
      'questionsText':
          '6.	In which of the following some devices are wired, and some are mobile. They altogether make communication with other devices.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wired', 'score': 1},
        {'text': 'B.	Fixed and Wired', "score": 0},
        {'text': 'C.	Fixed and Wireless', "score": 0},
        {'text': 'D.	Mobile and Wireless', "score": 0}
      ]
    },
    {
      'questionsText':
          '7.	In which of the following the devices can communicate with each other irrespective of their position.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wired', "score": 0},
        {'text': 'B.	Fixed and Wired', "score": 0},
        {'text': 'C.	Fixed and Wireless', "score": 0},
        {'text': 'D.	Mobile and Wireless', "score": 1}
      ]
    },
    {
      'questionsText': '8.	Wi-Fi Dongle Device of type.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wired', "score": 0},
        {'text': 'B.	Fixed and Wired', "score": 0},
        {'text': 'C.	Fixed and Wireless', "score": 0},
        {'text': 'D.	Mobile and Wireless', "score": 1}
      ]
    },
    {
      'questionsText': '9.	Laptop Device of type.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wireless', "score": 0},
        {'text': 'B.	Fixed and Wired', "score": 0},
        {'text': 'C.	Fixed and Wireless', "score": 0},
        {'text': 'D.	Mobile and Wired', "score": 1}
      ]
    },
    {
      'questionsText': '10.	Wi-Fi router Device of type.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wireless', "score": 0},
        {'text': 'B.	Fixed and Wired', "score": 0},
        {'text': 'C.	Mobile and wired', "score": 0},
        {'text': 'D.	Fixed and Wireless', "score": 1}
      ]
    },
    {
      'questionsText':
          '11.	Which one of the following enables us to use the entire bandwidth simultaneously?',
      'answeredQuestion': [
        {'text': 'A.	TDMA', "score": 0},
        {'text': 'B.	CDMA', "score": 1},
        {'text': 'C.	FDMA', "score": 0},
        {'text': 'D.	All of the above', "score": 0}
      ]
    },
    {
      'questionsText': '12.	Desktop Computer Device of type.',
      'answeredQuestion': [
        {'text': 'A.	Mobile and Wireless', "score": 0},
        {'text': 'B.	Fixed and Wireless', "score": 0},
        {'text': 'C.	Mobile and wired', "score": 0},
        {'text': 'D.	Fixed and Wired', "score": 1}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text("Quiz")),
            body: _questionIndex <= _questions.length - 1
                ? Quiz(
                    _questionAnswered, _questions, _questionIndex, _totalScore)
                : Result(_totalScore, _quizResting)));
  }
}
