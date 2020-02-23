import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          'Black',
          'Red',
          'Green',
          'White'
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          'Rabbit',
          'Snake',
          'Elephant',
          'Lion'
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          'Max',
          'John',
          'Bob',
          'Tom'
        ],
      },
    ];
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questionText: questions[_questionIndex]['questionText']
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(
                answerText: answer,
                selectHandler: _answerQuestion
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
