import 'package:flutter/material.dart';
import 'package:myfirstapp/quiz.dart';
import 'package:myfirstapp/result.dart';

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

  static final _questions = const [
    {
      "questionText": "what's your favorite animal ?",
      "answerText": [
        {"text": "rabbit", "score": 8},
        {"text": "elephant", "score": 6},
        {"text": "lion", "score": 4},
        {"text": "dog", "score": 10},
      ],
    },
    {
      "questionText": "what's your favorite color ?",
      "answerText": [
        {"text": "red", "score": 7},
        {"text": "green", "score": 10},
        {"text": "white", "score": 9},
        {"text": "blue", "score": 5},
      ],
    },
    {
      "questionText": "who's your favorite instructor ?",
      "answerText": [
        {"text": "Max", "score": 9},
        {"text": "Hitesh", "score": 6},
        {"text": "navin", "score": 8},
        {"text": "arun", "score": 10},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My First App",
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

//33 completed
