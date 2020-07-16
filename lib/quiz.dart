import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
        .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}


// @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // we can pass text to a widget
//         Question(questions[questionIndex]['questionText']),

//         // THIS IS WHAT WE DID BEFORE SEPERATING FILES
//         // Text(questions[_questionIndex]),
//         // dart can't understand that the 'answer' is a list of strings
//         // so we have to wrap it and make it obvious
//         // the three dots are a pread operator
//         ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
//           return Answer(answerQuestion, answer);
//         }).toList()

//         // THIS IS WHAT WE DID BEFORE CREATING A HASH MAP FOR ANSWERS
//         // we can also pass pointer to a function to a widget
//         // that means no parenthesis
//         // Answer(_answerQuestion),
//         // Answer(_answerQuestion),
//         // Answer(_answerQuestion),

//         // THIS IS WHAT WE DID BEFORE SEPERATING FILES
//         // RaisedButton(
//         //   child: Text('Answer 1 '),
//         //   onPressed: _answerQuestion,
//         // ),
//         // RaisedButton(
//         //   child: Text('Answer 2 '),
//         //   onPressed: () => print('Answer 2 Chosen!'),
//         // ),
//         // RaisedButton(
//         //   child: Text('Answer 3 '),
//         //   onPressed: () {
//         //     print('Answer 3 Chosen!');
//         //   }
//         // )
//       ],
//       // below is the ternary else block
//     );
//   }
