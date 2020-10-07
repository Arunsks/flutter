import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (totalScore <= 30) {
      resultText = "you are awsome";
    } else if (totalScore <= 20) {
      resultText = "your are likebale";
    } else if (totalScore <= 15) {
      resultText = "your are strange";
    } else {
      resultText = "you are bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
            onPressed: resetHandler,
            child: Text(
              "Reset Quiz",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
