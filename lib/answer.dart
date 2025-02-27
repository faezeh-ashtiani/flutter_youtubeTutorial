import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  // a runtime constant value => final
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.amber,
        textColor: Colors.pink,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
      
    );
  }
}