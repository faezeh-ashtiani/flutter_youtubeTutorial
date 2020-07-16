import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}
// can be written with arrow notation:
// void main() => runApp(MyApp());

// to change from StetelessWidget to StatefulWidget we need two classes, the other extends State class 
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// class name would be <my widget name>State
// state is a generic type so we need to indicate it belongs to MyApp class
// to inform dart that the MyAppState class should only be usable 
// from inside the main.dart file (inside the file it is defined) you need to
// add a leading undescore _ in front of the name
// it turns a public class into a private class 
// actually undescore is a special syntax that can be used on classes, 
// variables or functios to make them privat 
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 8},
        {'text': 'Yellow', 'score': 3},
        {'text': 'White', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 8},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 6},
      ],
    },
    {
      'questionText': 'Who is your favorite instructor',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 8},
        {'text': 'Max', 'score': 3},
        {'text': 'Max', 'score': 6},
       ],
    }

    // THIS IS WHAT WE DID BEFORE SEPERATING FILES
    // 'What\'s your favorite color?',
    // 'What\'s your favorite animal',
  ];
  
  
  // in dart a variable in a class is called a property
  var _questionIndex = 0;
  var _totalScore =0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore =0;
    });
  }

  // var questions = [
  // compile time constant => const
  
  // in dart a function in a class is called a method
  void _answerQuestion(int score) {
    _totalScore += score;
    // set state forces the widget from which we call set state to build again 
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length ) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
    
  }
  // this is a decorator annotation and it apparently is not neccassary
  // but it deliberately makes it clear that we are doing our own thing
  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    
    // MaterialApp uses a lot of optional named arguments
    // home is a core widget
    // Text is nother widget
    // Scafold widget gives you styling capabilities
    // return MaterialApp(home: Text('Hello!'),);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App')
        ),
        // a ternary 
        body: _questionIndex < _questions.length ? 
          // the entire column widget that is now in quiz.dart was here
          Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions
          )
          : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
