import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // we need to wrap text in a container to center it
    // a container can have a 
    // padding: arround the child, inside the border line
    // border: arround the padding
    // margin: arround the border - between this widget and others
    return Container(
      // double.infinity ensures the widget is getting as much width as it can
      width: double.infinity,
      // the dot notation after the class is a constructor, these classes have 
      // different constructors. if you put a dot after the class name, the 
      // constuctor types pop up and you can know your options
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center
      ),
    );
  }
}
