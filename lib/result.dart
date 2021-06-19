import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  String get resultPhrase {
    String resultText;
    if (resultScore <= 5) {
      resultText = "Awesome";
    } else if (resultScore > 5 && resultScore <= 8) {
      resultText = "Excellent";
    } else {
      resultText = "Great!";
    }
    return resultText;
  }

  Result(this.resultScore, this.resetHandler);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text("Restart the app"),
            textColor: Colors.blue[300],
          )
        ],
      ),
    );
  }
}
