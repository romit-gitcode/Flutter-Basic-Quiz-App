import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// import './Answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// ignore: must_be_immutable
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your Fav Sport?',
      'answers': [
        {'text': 'Football', 'score': 3},
        {'text': 'Basketball', 'score': 7},
        {'text': 'Cricket', 'score': 5},
        {'text': 'vollyball', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your Fav Colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Blue', 'score': 5},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'Who is your Fav Singer?',
      'answers': [
        {'text': 'Arjit Sing', 'score': 1},
        {'text': 'Ed Sheeran', 'score': 4},
        {'text': 'Charlie Puth', 'score': 5},
        {'text': 'Shawn Mendes', 'score': 8},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions!!");
    } else
      print("Questions exausted!");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey[600],
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("My 1st App!"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
